import React, { Component } from 'react'
import { View, TextInput, Button, StyleSheet, Picker } from 'react-native'
import { connect } from 'react-redux'

import { editRecord } from '../actions/recordActions'

const defaultRecord = {
  id: -1,
  recordType: '',
  ammount: 0
}

class RecordDetails extends Component {
  static navigationOptions = {
    title: 'Record\'s details'
  }

  constructor(props) {
    super(props)

    const { navigation } = this.props
    this.state = navigation.getParam('record', defaultRecord)
  }

  render() {
    const { recordType, ammount } = this.state
    const { editRecord, navigation } = this.props
    const defaultRecord = navigation.getParam('record', defaultRecord)

    return (
      <View style={styles.container}>
        <Picker
          selectedValue={recordType}
          onValueChange={(itemValue) => this.setState({ recordType: itemValue })}>
          <Picker.Item label='Income' value='Income' />
          <Picker.Item label='Expense' value='Expense' />
        </Picker>
        <TextInput
          keyboardType='numeric'
          value={`${ammount}`}
          onChangeText={(value) => {
            const num = value.replace('.', '')
            if (!isNaN(num)) this.setState({ ammount: Number(num) })
          }}
        />
        <View style={styles.button} >
          <Button 
            disabled={JSON.stringify(this.state) === JSON.stringify(defaultRecord)} 
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
  button: {
    width: '100%',
    position: 'absolute',
    bottom: 0,
  }
})

const mapDispatchToProps = dispatch => ({
  editRecord(record) {
    dispatch(editRecord(record))
  }
})

export default connect(null, mapDispatchToProps)(RecordDetails)
