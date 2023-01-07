import React from "react";
import { Dispatch, SetStateAction } from "react";



interface Item {
    id: number,
    name: string,
    price: string,
    categorgy_id: string,
    created_at: string,
    updated_at: string
}

interface Props {
    items: Item[],
    setCart: Dispatch<SetStateAction<Item[]>>;

}
const ItemPage: React.FC<Props> = ({items, setCart}) => {



return (
    <>
    {items.map( item => <button onClick={()=> {setCart(prev => [...prev, item] )}} key={item.id}>{item.name}</button>)}
    </>
)
}

export default ItemPage