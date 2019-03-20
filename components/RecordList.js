import React from 'react'
import { View, FlatList, StyleSheet, TouchableHighlight } from 'react-native'
import PropTypes from 'prop-types'

import RecordType from '../propTypes/RecordType'
import Record from './Record'

const numOfColumns = 2

const RecordList = ({ records, onRecordPress }) => {
  const renderItem = ({ item }) => (
    item.invisible
      ? <View style={styles.item} />
      : (
        <TouchableHighlight style={styles.item} onPress={() => onRecordPress(item)}>
          <Record record={item} />
        </TouchableHighlight>
      )
  )

  return (
    <FlatList
      style={styles.list}
      data={formatData(records, numOfColumns)}
      renderItem={renderItem}
      numColumns={numOfColumns}
      keyExtractor={(item) => item.id}
    />
  )
}

const formatData = (data, numOfColumns) => {
  const newData = [...data]
  let numberOfElementsLastRow = data.length % numOfColumns
  while (numberOfElementsLastRow !== 0 && numberOfElementsLastRow !== numOfColumns) {
    newData.push({
      invisible: true
    })
    numberOfElementsLastRow++
  }

  return newData
}

RecordList.propTypes = {
  records: PropTypes.arrayOf(
    PropTypes.shape(RecordType)
  ).isRequired
}

const styles = StyleSheet.create({
  hidden: {
    backgroundColor: 'transparent',
    elevation: 0
  },
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
