import * as React from "react";

export default class WelcomeContent extends React.Component {

    render() {
        return(
            <div className="row justify-content-md-center">
                <div className="jumbotron jumbotrom-fluid">
                    <div className="container">
                        <h1 className="display-4">Welcome</h1>
                    </div>
                </div>
            </div>
        );
    };
}