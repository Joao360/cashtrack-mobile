/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, { Component } from 'react';
import { Platform, StyleSheet, Text, View, ScrollView, TouchableOpacity } from 'react-native';

import RecordList from './components/RecordList'

const instructions = Platform.select({
  ios: 'Press Cmd+R to reload,\n' + 'Cmd+D or shake for dev menu',
  android:
    'Double tap R on your keyboard to reload,\n' +
    'Shake or press menu button for dev menu',
});

type Props = {}
export default class App extends Component<Props> {
  render() {
    return (
      <View style={styles.container}>
        <RecordList records={records} />
        <View>
          <TouchableOpacity style={styles.floatingButton}>
            <Text>Yo Press Me!</Text>
          </TouchableOpacity>
        </View>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    width: '100%',
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
  floatingButton: {
    position: 'absolute',
    bottom: 15
  },
})

const records = [
  {
    id: 1,
    recordType: "Expense",
    ammount: 20
  },
  {
    id: 2,
    recordType: "Income",
    ammount: 5
  },
  {
    id: 3,
    recordType: "Income",
    ammount: 200
  }
]

