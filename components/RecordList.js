import React from 'react'
import { FlatList, StyleSheet, TouchableHighlight } from 'react-native'
import PropTypes from 'prop-types'

import RecordType from '../propTypes/RecordType'
import Record from './Record'

const RecordList = ({ records, onRecordPress }) => {
  const renderItem = ({ item }) => (
    <TouchableHighlight style={styles.item} onPress={() => onRecordPress(item)}>
      <Record record={item} />
    </TouchableHighlight>
  )

  return (
    <FlatList
      style={styles.list}
      data={records}
      renderItem={renderItem}
      keyExtractor={(item) => item.id}
    />
  )
}

RecordList.propTypes = {
  records: PropTypes.arrayOf(
    PropTypes.shape(RecordType)
  ).isRequired
}

const styles = StyleSheet.create({
  item: {
    flex: 1
  },
  list: {
    flex: 1,
    height: '100%',
    width: '100%'
  }
})

export default RecordList
