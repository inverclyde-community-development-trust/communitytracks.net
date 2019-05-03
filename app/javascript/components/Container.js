import React, { Component } from 'react'
import WardMap from './WardMap'
import fetch from 'cross-fetch';

export default class Container extends Component {
  constructor(props) {
    super(...arguments)
    this.state = {
      ward: props.ward,
      selectedLayers: props.ward.layers.map((layer, i) => ({
        value: i,
        label: layer.name
      }))
    }
  }

  componentDidMount() {
    this.loadWardOutline(this.state.selectedWardIndex)
  }

  loadWardOutline(selectedWardIndex) {
    const { ward } = this.state

    if (ward == null || ward.outline_json_url == null) {
      return
    }

    fetch(ward.outline_json_url)
      .then(resp => resp.json())
      .then(data => {
        const { ward } = this.state

        this.setState({
          ward: {
            ...ward,
            outline_coordinates: data.coordinates
          }
        })
      })
      .catch(err => {
        console.error('Error loading outline for ward', ward)
      })
  }

  render() {
    const { ward, selectedLayers } = this.state
    var red = {
      width: '100%',
      border: '1px solid #ff0000',
      };
    var green = {
      width: '100%',
      border: '1px solid #00ff00',
      };
    var blue = {
      width: '100%',
      border: '1px solid #33ccff',
      };
    var yellow = {
      width: '100%',
      border: '1px solid #ffff00',
      };
    var leisure = {
      width: '1rem',
    };
    var heading = {
      padding: '5px',
      border: '0px',
    }
    var lib = {
      width: '1rem'
    }
    return (
      <div>
        <div className="container-fluid">
        <h3 className="m-0" style={heading}>{ward.name}</h3>
          <div className="row">
            <div className="col-lg-10 col-md-12 col-sm-12">
            <div className="card mx-auto" style={heading}>
                <div className="card-title">Inverclyde Core Path Network are routes for everyday trips and access to the outdoors for recreation. Please leave feedback by clicking on the lines on the map. For more information visit the Inveclyde Council website, <a href="https://www.inverclyde.gov.uk/planning-and-the-environment/outdoor-access-in-inverclyde/core-paths-network">here</a>  </div>
              </div>  
              <WardMap ward={ward} visibleLayers={selectedLayers} />
            </div>
            <div className="col d-none d-lg-block">
              <br>
              </br>
              <br></br>
              <br></br>
              <p className="text-center font-weight-bold">Map Key</p>
              <div className="card p-1 col-sm-6 col-md-12">
                <hr style={red} /> dust/stone off-road path
              </div>
              <div className="card p-1 col-sm-6 col-md-12">
                 <hr style={green} /> sealed path
              </div>
              <div className="card p-1  col-sm-6 col-md-12">
                 <hr style={blue} /> on road or pavement
              </div>
              <div className="card p-1 col-sm-6 col-md-12">
                   <hr style={yellow} /> off-road path
              </div>
              <div className="card p-1">
                <p><img src="https://s3.eu-west-2.amazonaws.com/comtracks/icon/lib.png" style={lib}/>&nbsp; Library</p>
                <p><img src="https://s3.eu-west-2.amazonaws.com/comtracks/icon/leisure2.png" style={leisure}/>&nbsp; Leisure Centres</p>
                <p><img src="https://s3.eu-west-2.amazonaws.com/comtracks/_smaller_noun_1100330_cc1.png" style={leisure}/>&nbsp; Community Centres</p>
                <p><img src="https://s3.eu-west-2.amazonaws.com/comtracks/high-school-icon-blue.png" style={leisure}/>&nbsp; Secondary Schools</p>
                <p><img src="https://s3.eu-west-2.amazonaws.com/comtracks/high-school-icon-png-8.png.png" style={leisure}/>&nbsp; Primary Schools</p>
              </div>
            </div>
            <div className="col d-lg-none">
                 <div className="row">
                    <div className="card p-1 col-6">
                      <hr style={red} /> dust/stone off-road path
                    </div>
                    <div className="card p-1 col-6">
                      <hr style={green} /> sealed path
                    </div>
                    <div className="card p-1  col-6">
                      <hr style={blue} /> on road or pavement
                    </div>
                    <div className="card p-1 col-6">
                        <hr style={yellow} /> off-road path
                    </div>
                    <div className="card p-1 col-6">
                      <p><img src="https://s3.eu-west-2.amazonaws.com/comtracks/icon/lib.png" style={lib}/>&nbsp; Library</p>
                      <p><img src="https://s3.eu-west-2.amazonaws.com/comtracks/icon/leisure2.png" style={leisure}/>&nbsp; Leisure Centres</p>
                    </div>
                    <div className="card p-1 col-6">
                      <p><img src="https://s3.eu-west-2.amazonaws.com/comtracks/_smaller_noun_1100330_cc1.png" style={leisure}/>&nbsp; Community Centres</p>
                      <p><img src="https://s3.eu-west-2.amazonaws.com/comtracks/high-school-icon-blue.png" style={leisure}/>&nbsp; Secondary Schools</p>
                      <p><img src="https://s3.eu-west-2.amazonaws.com/comtracks/high-school-icon-png-8.png.png" style={leisure}/>&nbsp; Primary Schools</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
    )
  }
}
