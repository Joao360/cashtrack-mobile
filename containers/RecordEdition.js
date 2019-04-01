import React, { Component } from 'react'
import { View, TextInput, Button, StyleSheet, Picker, Text, ScrollView } from 'react-native'
import { ButtonGroup } from 'react-native-elements'
import { connect } from 'react-redux'

import { editRecord } from '../actions/recordActions'
import { RecordExpenseInput, RecordIncomeInput } from '../components/RecordEditionInputs'

const defaultRecord = {
  id: -1,
  recordType: 'Expense',
  ammount: 0
}

const types = ['Expense', 'Income']

class RecordEdition extends Component {
  static navigationOptions = {
    title: 'Record\'s details'
  }

  constructor(props) {
    super(props)

    const { navigation } = this.props
    this.state = navigation.getParam('record', defaultRecord)

    this.onIndexChanged = this.onIndexChanged.bind(this)
  }

  onIndexChanged(index) {
    this.setState({ recordType: index === 0 ? 'Expense' : 'Income' })
  }

  render() {
    const { recordType, ammount } = this.state
    const { editRecord, navigation, balance } = this.props
    const originalRecord = navigation.getParam('record', originalRecord)

    return (
      <View style={styles.container}>
        <ButtonGroup
          onPress={this.onIndexChanged}
          selectedIndex={recordType === 'Expense' ? 0 : 1}
          buttons={types}
        />

        {recordType === 'Expense' 
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

const mapDispatchToProps = dispatch => ({
  editRecord(record) {
    dispatch(editRecord(record))
  }
})

export default connect(mapStateToProps, mapDispatchToProps)(RecordEdition)