/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, { Component } from 'react'
import { StyleSheet, Text, View, TouchableOpacity } from 'react-native'
import { Provider } from 'react-redux'
import { createStore } from 'redux'

import Records from './containers/RecordContainer'
import recordReducer from './reducers/RecordReducer'
import { addRecord } from './actions/recordActions'

const store = createStore(recordReducer)

export default class App extends Component {
  addRecord () {
    store.dispatch(addRecord({ id: 9, recordType: 'Income', ammount: 1 }))
  }

  render () {
    return (
      <Provider store={store}>
        <View style={styles.container}>
          <Records />
          <View>
            <TouchableOpacity style={styles.floatingButton} onPress={this.addRecord}>
              <Text>Yo Press Me!</Text>
            </TouchableOpacity>
          </View>
        </View>
      </Provider>
    )
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    width: '100%',
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF'
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5
  },
  floatingButton: {
    position: 'absolute',
    bottom: 15
  }
})
