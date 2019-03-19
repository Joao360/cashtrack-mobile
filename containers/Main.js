import React from 'react'
import { StyleSheet, View } from 'react-native'
import { connect } from 'react-redux'

import RecordList from '../components/RecordList'
import AddRecord from '../components/AddRecord'
import { addRecord } from '../actions/recordActions'

const Main = ({ records, addRecord }) => (
  <View style={styles.container}>
    <RecordList records={records} />
    <AddRecord onPress={addRecord} />
  </View>
)

const styles = StyleSheet.create({
  container: {
    flex: 1,
    width: '100%',
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF'
  }
})

const mapStateToProps = state => ({
  records: state.records
})

const mapDispatchToProps = dispatch => ({
  addRecord () {
    dispatch(addRecord({ id: 9, ammount: 1, recordType: 'Income' }))
  }
})

export default connect(mapStateToProps, mapDispatchToProps)(Main)
