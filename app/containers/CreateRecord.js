import React, { Component } from 'react'
import { View, TextInput, Button, StyleSheet, Text } from 'react-native'
import { ButtonGroup } from 'react-native-elements'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'

import { addRecord } from '../actions/recordActions'
import { RecordExpenseInput, RecordIncomeInput } from '../components/RecordEditionInputs'
import { recordTypes, income, expense } from '../modules/constants'

class CreateRecord extends Component {
  static navigationOptions = {
    title: 'Create a new Record'
  }

  onIndexChanged = (index) => {
    this.setState({ recordType: index === 0 ? expense : income })
  }

  render() {
    const { recordType, ammount } = this.state
    const { editRecord, navigation, balance } = this.props
    const originalRecord = navigation.getParam('record', originalRecord)

    return (
      <View style={styles.container}>
        <ButtonGroup
          onPress={this.onIndexChanged}
          selectedIndex={recordType === expense ? 0 : 1}
          buttons={recordTypes}
        />

        {recordType === expense 
          ? <RecordExpenseInput balance={balance} ammount={ammount} />
          : <RecordIncomeInput balance={balance} ammount={ammount} />}

        <Text style={styles.label}>Category</Text>
        <TextInput
          style={styles.input}
          keyboardType='numeric'
          value={`${ammount}`}
          onChangeText={(value) => {
            const num = value.replace('.', '')
            if (!isNaN(num)) this.setState({ ammount: Number(num) })
          }}
        />
        <View style={styles.button} >
          <Button
            disabled={JSON.stringify(this.state) === JSON.stringify(originalRecord)}
            title='Save'
            onPress={() => {
              editRecord(this.state)
              navigation.goBack()
            }}
          />
        </View>
      </View>
    )
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  input: {
    margin: 8,
    backgroundColor: 'lightgrey',
    color: 'white',
  },
  button: {
    width: '100%',
    position: 'absolute',
    bottom: 0,
  },
  label: {
    margin: 8
  },
  swiper: {

  },
  slide1: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#9DD6EB',
  },
  slide2: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#97CAE5',
  },
  text: {
    color: '#fff',
    fontSize: 30,
    fontWeight: 'bold',
  }
})

const mapStateToProps = state => ({
  balance: state.balance
})

const mapDispatchToProps = dispatch => (
  bindActionCreators(
    {
      addRecord
    },
    dispatch
  )
)

export default connect(mapStateToProps, mapDispatchToProps)(CreateRecord)