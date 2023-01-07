import { useEffect, useState } from "react"
import React from "react"
import '../styles/Home.css'
import ItemPage from './ItemPage';

interface CategoryObj  {
    name: string,
    description: string,
    created_at: string,
    updated_at: string,
    id: number
}

interface ItemObj {
    id: number,
    name: string,
    price: string,
    categorgy_id: string,
    created_at: string,
    updated_at: string
}


const Home: React.FC = () => {

const [categories, setCategories] = useState<CategoryObj[]>([])
const [categoryIsActive, setCategoryIsActive] = useState<boolean>(true)
const [items, setItems] = useState<ItemObj[]>([])
const [cart, setCart] = useState<ItemObj[]>([])

const getCategories = async() => {
    let req = await fetch('/categories')
    let res = await req.json()
    console.log(res)
    setCategories(res)
}

const getItemsByCategories = async (categoryId: number) => {
    console.log(categoryId)
    let req = await fetch(`/items_by_category/${categoryId}`)
    let res = await req.json()
    console.log(res)
    setItems(res)
    setCategoryIsActive(false)
}



useEffect( () => {
    getCategories()
}, [])

console.log(cart)

return (
    <main>
        <button onClick={()=> {setCategoryIsActive(true)}}>Back</button>
        <div>
           { categoryIsActive && <div id="category_container">
                {categories.map( category => <button className="category_btn" onClick={()=> {getItemsByCategories(category.id)}} key={category?.id}>{category?.name}</button>)}
            </div>}
        </div>
       { !categoryIsActive && <ItemPage items={items} setCart={setCart} />}
    </main>
)
}

export default Home

