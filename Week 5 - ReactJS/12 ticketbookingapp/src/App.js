import React, { Component } from "react";
import Greeting from "./Greeting";
import LoginButton from "./LoginButton";
import LogoutButton from "./LogoutButton";

class App extends Component {

    constructor(props) {
        super(props);

        this.state = {
            isLoggedIn: false
        };
    }

    handleLoginClick = () => {
        this.setState({
            isLoggedIn: true
        });
    };

    handleLogoutClick = () => {
        this.setState({
            isLoggedIn: false
        });
    };

    render() {

        let button;

        if (this.state.isLoggedIn) {
            button = (
                <LogoutButton
                    onClick={this.handleLogoutClick}
                />
            );
        } else {
            button = (
                <LoginButton
                    onClick={this.handleLoginClick}
                />
            );
        }

        return (
            <div style={{ marginLeft: "170px", marginTop: "100px" }}>

                <Greeting
                    isLoggedIn={this.state.isLoggedIn}
                />

                {button}

            </div>
        );
    }
}

export default App;