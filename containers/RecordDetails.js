import React, { Component } from 'react'
import { View, Text } from 'react-native'

const defaultRecord = {
  id: -1,
  recordType: '',
  ammount: 0
}

class RecordDetails extends Component {
  static navigationOptions = {
    title: 'Record\'s details'
  }

  render () {
    const { navigation } = this.props

    const { id, recordType, ammount } = navigation.getParam('record', defaultRecord)

    return (
      <View>
        <Text>{id}</Text>
        <Text>{recordType}</Text>
        <Text>{ammount}</Text>
      </View>
    )
  }
}

export default RecordDetails
