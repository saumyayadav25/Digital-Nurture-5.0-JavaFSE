import React from "react";

const players = [
    { name: "Virat", score: 95 },
    { name: "Rohit", score: 82 },
    { name: "Gill", score: 65 },
    { name: "Rahul", score: 45 },
    { name: "Pant", score: 77 },
    { name: "Hardik", score: 52 },
    { name: "Jadeja", score: 88 },
    { name: "Ashwin", score: 69 },
    { name: "Shami", score: 30 },
    { name: "Bumrah", score: 73 },
    { name: "Siraj", score: 61 }
];

export function ListofPlayers() {
    return (
        <div>
            {players.map((item, index) => (
                <li key={index}>
                    Mr. {item.name} <span>{item.score}</span>
                </li>
            ))}
        </div>
    );
}

export function Scorebelow70() {

    const players70 = [];

    players.map((item) => {
        if (item.score <= 70) {
            players70.push(item);
        }
        return null;
    });

    return (
        <div>
            {players70.map((item, index) => (
                <li key={index}>
                    Mr. {item.name} <span>{item.score}</span>
                </li>
            ))}
        </div>
    );
}