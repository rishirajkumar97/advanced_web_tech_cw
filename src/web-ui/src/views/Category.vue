<template>
  <b-container>
    <b-row class="sticky-top">
      <b-col>
        <h3>Select Technology</h3>
        <!-- Floating Dropdown for Topics -->
        <b-form-select v-model="selectedTopic" class="mb-4" :options="topicOptions" @change="loadPost"></b-form-select>
      </b-col>
    </b-row>

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
      let tempId = 2;
      console.log(this.selectedTopic);
      // Now including the topic in the dispatch
      this.$store.dispatch('postsModule/updateCategory', {
        categoryId: tempId,
        topic: this.selectedTopic,
      });
    },
  },
};
</script>

<style>

.sticky-top {
  position: sticky;
  top: 0;  /* Adjust this value based on your desired offset from the top */
  z-index: 1000;  /* Ensures it stays on top of other content */
  background: white;  /* Optional: sets a background color */
  box-shadow: 0 2px 5px rgba(0,0,0,0.1);  /* Optional: adds shadow for better visibility */
}
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

