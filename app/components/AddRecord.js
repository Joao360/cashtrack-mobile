import React from 'react'
import { StyleSheet, View, Image, TouchableOpacity } from 'react-native'

const AddRecordButton = ({ onPress }) => (
  <View style={styles.floatingButton}>
    <TouchableOpacity onPress={onPress}>
      <Image style={styles.image} source={require('../assets/images/add.png')} />
    </TouchableOpacity>
  </View>

)

const styles = StyleSheet.create({
  floatingButton: {
    position: 'absolute',
    bottom: 15,
    right: 15
  },
  image: {
    width: 40,
    height: 40
  }
})

export default AddRecordButton
