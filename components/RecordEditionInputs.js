import React, { Component } from 'react'
import { View, TextInput, StyleSheet, Text } from 'react-native'

class RecordEditionInput extends Component {
  constructor(props) {
    super(props)

    const { ammount } = this.props
    
    this.isNewRecord = ammount === undefined

    this.state = {
      ammount: ammount ? ammount : 0
    }
  }

  render() {
    const { balance, expense } = this.props
    const { ammount } = this.state

    const computedBalance = !expense != !this.isNewRecord ? balance + ammount : balance - ammount

    return (
      <View>
        <Text style={styles.text}>{this.isNewRecord ? 'Balance' : 'Before'}: {this.isNewRecord ? balance : computedBalance}</Text>
        <View style={styles.ammount}>
          <TextInput
            style={styles.textInput}
            keyboardType='numeric'
            value={ammount !== 0 ? `${ammount}` : ''}
            placeholder='0.0'
            placeholderTextColor='grey'
            onChangeText={value => {
              this.setState({ ammount: parseFloat(value.replace(',', '.')) })
            }}
          />
          <Text style={[styles.textInput, styles.currency]}>€</Text>
        </View>
        <Text style={[styles.text, styles.after]}>{this.isNewRecord ? computedBalance : balance} :{this.isNewRecord ? 'After' : 'Balance'}</Text>
      </View>
    )
  }
}

const styles = StyleSheet.create({
  text: {
    margin: 15,
  },
  textInput: {
    alignSelf: 'center',
    width: 80,
    textAlign: 'center',
    padding: 10,
    borderBottomColor: 'black',
    borderBottomWidth: 2,
    margin: 8,
  },
  after: {
    alignSelf: 'flex-end',
  },
  ammount: {
    flexDirection: 'row',
    justifyContent: 'center'
  },
  currency: {
    marginHorizontal: 0,
    paddingHorizontal: 0,
    width: 'auto'
  }
})

export const RecordExpenseInput = (props) => (
  <RecordEditionInput {...props} expense={true} />
)

export const RecordIncomeInput = (props) => (
  <RecordEditionInput {...props} expense={false} />
)