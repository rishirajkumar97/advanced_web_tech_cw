<template>
  <b-container>
    <b-row>
      <b-col lg="4" md="6" class="mb-2 mt-2" v-for="post in posts" :key="post.id">
        <AppPost :post="post"></AppPost>
      </b-col>
    </b-row>
  </b-container>
</template>

<script>
import { mapGetters } from 'vuex';
import AppPost from './../components/AppPost.vue';

export default {
  name: 'home',
  components: {
    AppPost,
  },
  created() {
    this.loadPost();
  },
  computed: {
    ...mapGetters('postsModule', ['posts']),
  },
  watch: {
    $route() {
      this.loadPost();
    },
  },
  methods: {
    loadPost() {
      let categoryId = 2;
      if (this.$route.params.id === 'mobile') {
        categoryId = 11;
      }
      this.$store.dispatch('postsModule/updateCategory', categoryId);
    },
  },
};
</script>

<style>
/* Adjust the styles for the AppPost component */
.app-post {
  text-align: left; /* Align content to the left */
}

/* Make the headings and expert text bold */
.app-post .card-title {
  font-weight: bold;
}

.app-post .expert {
  font-weight: bold;
}
</style>

