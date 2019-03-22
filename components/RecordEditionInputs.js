import React, { Component } from 'react'
import { View, TextInput, StyleSheet, Text } from 'react-native'


class RecordEditionInput extends Component {
  render() {
    const { balance, expense } = this.props

    return (
      <View style={[styles.container, expense ? {backgroundColor: 'red'} : {backgroundColor: 'green'}]}>
        <Text style={[styles.text, styles.title]}>{expense ? 'Expense' : 'Income'}</Text>
        <Text style={styles.text}>Balance: {balance}</Text>
        <TextInput style={styles.textInput} placeholder='0.0€' placeholderTextColor='lightgrey'/>
        <Text style={[styles.text, styles.after]}>:After</Text>
      </View>
    )
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  title: {
    fontSize: 24,
    textAlign: 'center',
    fontWeight: 'bold'
  },
  text: {
    margin: 15,
    color: 'white'
  },
  textInput: {
    alignSelf: 'center',
    width: 80,
    textAlign: 'center',
    padding: 10,
    borderBottomColor:'black',
    borderBottomWidth: 2,
    margin:8,
  },
  after: {
    alignSelf: 'flex-end',
  }
})

export const RecordExpenseInput = (props) => (
  <RecordEditionInput {...props} expense={true} />
)

export const RecordIncomeInput = (props) => (
  <RecordEditionInput {...props} expense={false} />
)