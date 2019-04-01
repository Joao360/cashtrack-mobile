import React from 'react'
import { View, Text, StyleSheet, Platform } from 'react-native'
import PropTypes from 'prop-types'

import RecordType from '../propTypes/RecordType'

const Record = ({ record: { recordType, ammount } }) => (
  <View style={[styles.card, recordType === 'Expense' ? styles.expense : styles.income]} >
    <Text style={styles.text}>{ammount}</Text>
  </View>
)

const styles = StyleSheet.create({
  card: {
    shadowColor: '#000000',
    shadowOffset: {
      width: Platform.OS === 'ios' ? 3 : 0,
      height: Platform.OS === 'ios' ? 3 : 0
    },
    shadowOpacity: 0.3,
    shadowRadius: 3,
    padding: 20,
    margin: 10,
    borderRadius: 3,
    elevation: 3,
    flex: 1,
    alignItems: 'center'
  },
  income: {
    backgroundColor: 'green'
  },
  expense: {
    backgroundColor: 'red'
  },
  text: {
    color: 'white'
  }
})

Record.propTypes = {
  record: PropTypes.shape(RecordType)
}

export default Record
