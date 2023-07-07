{
    "books": [
        "$book_id": {
            /* Unencrypted */
            "id": "$book_id",
            "userId1": "...",
            "userId2": "...",
            "publicKey": "...",

            /* Encrypted with publicKey */
            "title": "...",
            "person1": "...",
            "person2": "...",
            "currency": "...",
            "balance": 0,
        }
    ],
    "profiles": [
        "$user_id": {
            /* Unencrypted */
            "id": "$user_id",
            "publicKey": "...",

            /* Encrypted with publicKey */
            "name": "...",
        }
    ],
}
