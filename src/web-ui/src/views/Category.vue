<template>
  <b-container>
<<<<<<< HEAD
=======
    <b-row class="sticky-top">
      <b-col>
        <h3>Select Technology</h3>
        <!-- Floating Dropdown for Topics -->
        <b-form-select v-model="selectedTopic" class="mb-4" :options="topicOptions" @change="loadPost"></b-form-select>
      </b-col>
    </b-row>
>>>>>>> 6e95c990e013a08e00d8ca0d901dec15953df509

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
<<<<<<< HEAD
=======
  data() {
    return {
      selectedTopic: null, // Default selection
      topicOptions: [
        { value: null, text: 'All', disabled: false },
        { value: 'blockchain', text: 'Blockchain' },
        { value: 'earnings', text: 'Earnings' },
        { value: 'ipo', text: 'IPO' },
      ],
    };
  },
>>>>>>> 6e95c990e013a08e00d8ca0d901dec15953df509
  created() {
    this.loadPost();
  },
  computed: {
    ...mapGetters('postsModule', ['posts']),
<<<<<<< HEAD

=======
>>>>>>> 6e95c990e013a08e00d8ca0d901dec15953df509
  },
  watch: {
    $route() {
      this.loadPost();
    },
  },
  methods: {
    loadPost() {
<<<<<<< HEAD
      let categoryId = 2;
      if (this.$route.params.id === 'mobile') {
        categoryId = 11;
      }
      this.$store.dispatch('postsModule/updateCategory', categoryId);
=======
      let tempId = 2;
      console.log(this.selectedTopic);
      // Now including the topic in the dispatch
      this.$store.dispatch('postsModule/updateCategory', {
        categoryId: tempId,
        topic: this.selectedTopic,
      });
>>>>>>> 6e95c990e013a08e00d8ca0d901dec15953df509
    },
  },
};
</script>

<style>
<<<<<<< HEAD
=======

.sticky-top {
  position: sticky;
  top: 0;  /* Adjust this value based on your desired offset from the top */
  z-index: 1000;  /* Ensures it stays on top of other content */
  background: white;  /* Optional: sets a background color */
  box-shadow: 0 2px 5px rgba(0,0,0,0.1);  /* Optional: adds shadow for better visibility */
}
>>>>>>> 6e95c990e013a08e00d8ca0d901dec15953df509
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

