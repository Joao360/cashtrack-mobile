import React from 'react'
import { View, Text, StyleSheet, Platform } from 'react-native'
import PropTypes from 'prop-types'

import RecordType from '../propTypes/RecordType'

const Record = ({ record: { recordType, ammount } }) => (
  <View style={styles.card} >
    <Text>{ammount}</Text>
  </View>
)

export const styles = StyleSheet.create({
  card: {
    shadowColor: '#000000',
    shadowOffset: {
      width: Platform.OS === 'ios' ? 3 : 0,
      height: Platform.OS === 'ios' ? 3 : 0
    },
    shadowOpacity: 0.3,
    shadowRadius: 3,
    backgroundColor: '#ffffff',
    padding: 20,
    margin: 10,
    borderRadius: 3,
    elevation: 3,
    flex: 1,
    alignItems: 'center'
  }
})

Record.propTypes = {
  record: PropTypes.shape(RecordType)
}

export default Record
