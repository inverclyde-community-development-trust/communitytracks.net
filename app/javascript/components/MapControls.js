import React, { Component } from 'react'
import Select from 'react-select'

export default class MapControls extends Component {
  render() {
    const { ward, selectedLayers, onSelectedLayersChange } = this.props

    const routeOptions = ward.layers.map((layer, i) => ({
      value: i,
      label: layer.name
    }))

    return (
      <div className="ml-auto">
        <Select
          placeholder="Select Routes"
          className="my-2"
          isMulti
          options={routeOptions}
          value={selectedLayers}
          onChange={onSelectedLayersChange}
        />
      </div>
    )
  }
}
