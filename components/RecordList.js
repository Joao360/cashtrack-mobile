import React, { Component } from 'react'
import { FlatList } from 'react-native'
import PropTypes from 'prop-types'

import Record from './Record'

const RecordList = ({ records }) => (
  <FlatList
    data={records}
    renderItem={renderItem}
  />
)

const renderItem = ({ item }) => (
  <Record data={item} />
)

RecordList.propTypes = {
  records: PropTypes.string.isRequired
}
