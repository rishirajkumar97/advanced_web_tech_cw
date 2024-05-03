<template>
  <b-card no-body class="custom-card overflow-hidden">
    <div class="card-header">
      <h4 class="card-title">{{ post.title }}</h4>
    </div>
    <div class="card-body">
      <p class="card-text">{{ getSummary(post.summary) }}</p>
    </div>
    <div class="card-footer text-right">
      <em><a class="card-link" :href="post.url" target="_blank">Read More</a></em>
    </div>
  </b-card>
</template>

<script>
import Filters from './../filters/filters';

export default {
  props: ['post'],
  methods: {
    getSummary(summary) {
      const limit = this.post.expert ? 250 : 200;
      return Filters.dataSubstr(summary, limit);
    }
  },
};
</script>

<style scoped>
.custom-card {
  max-width: 540px;
  border: 1px solid #ccc;
  border-radius: 5px;
}

.card-header, .card-body, .card-footer {
  padding: 0.5rem 1rem;
}

.card-title {
  font-size: 1.25rem;
  margin-bottom: 0;
}

.card-text {
  font-size: 1rem;
}

.card-footer {
  padding: 0.5rem 1rem;
  background: none;
  border-top: none;
}

.card-link {
  color: #007bff;
  text-decoration: none;
}
</style>
