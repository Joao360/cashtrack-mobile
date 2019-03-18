import React from 'react'
import { View, FlatList, StyleSheet } from 'react-native'
import PropTypes from 'prop-types'
import RecordType from '../propTypes/RecordType'

import Record, { styles as RecordStyles } from './Record'

const numOfColumns = 2

const RecordList = ({ records }) => (
  <FlatList
    style={{
      flex: 1,
      height: '100%',
      width: '100%'
    }}
    data={formatData(records, numOfColumns)}
    renderItem={renderItem}
    numColumns={numOfColumns}
    keyExtractor={(item) => item.id}
  />
)

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

const renderItem = ({ item }) => {
  if (item.invisible) {
    return <View style={[RecordStyles.card, styles.hidden]} />
  } else return <Record record={item} />
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
  }
})

export default RecordList
