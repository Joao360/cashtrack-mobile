import React from 'react'
import { StyleSheet, View, Text, TouchableOpacity } from 'react-native'

const AddRecordButton = ({ onPress }) => (
  <View>
    <TouchableOpacity style={styles.floatingButton} onPress={onPress}>
      <Text>Yo Press Me!</Text>
    </TouchableOpacity>
  </View>

)

const styles = StyleSheet.create({
  floatingButton: {
    position: 'absolute',
    bottom: 15
  }
})

export default AddRecordButton
