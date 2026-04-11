import './main.css'
import Main from './src/Main.elm'
import "@nitramburesh/wcds"
import "@nitramburesh/wcds/style"

const app = Main.init({
    node: document.getElementById('root')
})