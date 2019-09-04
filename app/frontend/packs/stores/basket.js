export default store => {
  store.on('@init', () => ({ products: [] }))
}
