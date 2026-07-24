import officeImg from "./office.webp";

function App() {

    const element = "Office Space";

    const jsxatt = (
        <img
            src={officeImg}
            width="25%"
            height="25%"
            alt="Office Space"
        />
    );

    const offices = [
        {
            Name: "DBS",
            Rent: 50000,
            Address: "Chennai"
        },
        {
            Name: "Regus",
            Rent: 65000,
            Address: "Bangalore"
        },
        {
            Name: "WeWork",
            Rent: 75000,
            Address: "Hyderabad"
        },
        {
            Name: "SmartWorks",
            Rent: 55000,
            Address: "Pune"
        }
    ];

    return (
        <div style={{ marginLeft: "20px" }}>

            <h1>{element}, at Affordable Range</h1>

            {jsxatt}

            <hr />

            {offices.map((item, index) => {

                const color =
                    item.Rent <= 60000
                        ? { color: "red" }
                        : { color: "green" };

                return (
                    <div key={index}>
                        <h2>Name: {item.Name}</h2>

                        <h3 style={color}>
                            Rent: Rs. {item.Rent}
                        </h3>

                        <h3>
                            Address: {item.Address}
                        </h3>

                        <hr />
                    </div>
                );
            })}

        </div>
    );
}

export default App;