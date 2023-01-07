import { useEffect, useState } from "react"
import React from "react"
import './styles/Home.css'

interface CategoryObj  {
name: string,
description: string,
created_at: string,
updated_at: string,
id: number
}

const Home: React.FC = () => {

const [categories, setCategories] = useState<CategoryObj[]>([])

const getCategories = async() => {
    let req = await fetch('/categories')
    let res = await req.json()
    console.log(res)
    setCategories(res)
}

useEffect( () => {
    getCategories()
}, [])

return (
    <main>
        <div>
            <div id="category_container">
                {categories.map( category => <button className="category_btn" key={category?.id}>{category?.name}</button>)}
            </div>
        </div>
    </main>
)
}

export default Home

