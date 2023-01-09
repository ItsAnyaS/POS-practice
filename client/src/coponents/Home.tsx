import { FormEvent, useEffect, useState } from "react"
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

interface NewItem {
    name?: string,
    price?: number,
    category?: number
}


const Home: React.FC = () => {

const [categories, setCategories] = useState<CategoryObj[]>([])
const [categoryIsActive, setCategoryIsActive] = useState<boolean>(true)
const [items, setItems] = useState<ItemObj[]>([])
const [cart, setCart] = useState<ItemObj[]>([])
const [currentCategory, setCurrentCategory] = useState<number>()
const [newItem, setNewItem] = useState<NewItem>({name: '', price: 0, category: 0})
const [displayAddItemMenu, setDisplayAddItemMenu] = useState<boolean>(false)

const getCategories = async() => {
    let req = await fetch('/categories')
    let res = await req.json()
    console.log(res)
    setCategories(res)
}

const getItemsByCategories = async (categoryId: number) => {
    setCurrentCategory(categoryId)
    setNewItem({...newItem, category: categoryId})
    let req = await fetch(`/items_by_category/${categoryId}`)
    let res = await req.json()
    console.log(res)
    setItems(res)
    setCategoryIsActive(false)
}

const createItem = async(e:React.SyntheticEvent) => {
    e.preventDefault()
    let req = await fetch('/items', {
        method: "POST",
        headers: {"Content-type": "application/json"},
        body: JSON.stringify({
            name: newItem.name,
            price: newItem.price,
            category_id: newItem.category   
        })
    })
    let res = await req.json()
    console.log(res)
    setNewItem({name: '', price: 0, category: 0})
    setDisplayAddItemMenu(false)
}

const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
setNewItem({
    ...newItem,
    [e.target.name]: e.target.value.toLowerCase()
})
}

const chechout = async() => {
    
    let req = await fetch('/transactions', {
        method: "POST",
        headers: {"Content-type": "application/json"},
        body: JSON.stringify({
            cart: cart,
            tip: prompt("How much do you want to tip?"),
            period_id: 1
            //!Change ^^ this when doing auth
        })
    })
    let res = await req.json()
    console.log(res)
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
        {!categoryIsActive && <button onClick={()=> {setDisplayAddItemMenu(true)}}>Add Item</button>}
       {displayAddItemMenu &&  <form onSubmit={createItem}>
            <input placeholder="name" onChange={(e) => {handleChange(e)}} name='name'/>
            <input placeholder="price" name="price" onChange={(e) => {handleChange(e)}}/>
            <button>Add</button>
        </form>}
        <button onClick={() =>{chechout()}}>Checkout</button>
    </main>
)
}

export default Home

