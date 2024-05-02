<template>
  <b-card>
    <h4 class="card-title">{{ post.title }}</h4>
    <div class="card-body">
      <p class="card-text">{{ getSummary(post.summary) }}</p>
    </div>
    <em slot="footer"><a class="card-link" :href="post.url" target="_blank">Read More</a></em>
  </b-card>
</template>

<script>
import Filters from './../filters/filters';

export default {
  props: ['post'],
  methods: {
    getSummary(summary) {
      // For non-experts, limit summary to 200 characters
      if (!this.post.expert) {
        return Filters.dataSubstr(summary, 200);
      }
      // For experts, limit summary to 250 characters
      return Filters.dataSubstr(summary, 250);
    }
  },
};
</script>

<style scoped>
.b-card {
  width: 300px; /* Adjust width as needed */
  border: 1px solid #ccc;
  border-radius: 5px;
}

.card-title {
  font-size: 1.25rem;
  font-weight: bold;
  margin-bottom: 1rem;
}

.card-text {
  margin-bottom: 1rem;
}

.card-link {
  color: #007bff;
}
</style>



