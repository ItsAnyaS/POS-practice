import React from "react";


interface Item {
    id: number,
    name: string,
    price: string,
    created_at: string,
    updated_at: string
}

interface Props {
    items: Item[]
}
const ItemPage: React.FC<Props> = ({items}) => {

    console.log(items)
return (
    <>
    {items.map( item => <button key={item.id}>{item.name}</button>)}
    </>
)
}

export default ItemPage