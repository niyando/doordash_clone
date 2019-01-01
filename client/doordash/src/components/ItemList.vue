<template>
  <div>
    <h4 v-if="loading">Loading...</h4>
    <item
      v-for="i in items"
      :key="i.id"
      :item="i">
    </item>
  </div>
</template>

<script>
  import { ALL_ITEMS_QUERY } from '../constants/graphql'
  import Item from './Item'

  export default {
    name: 'ItemList',
    data () {
      return {
        items: [],
        loading: 0
      }
    },
    components: {
      Item
    },
    apollo: {
      items: {
        query: ALL_ITEMS_QUERY
      }
    }
  }
</script>