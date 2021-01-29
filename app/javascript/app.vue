<template>
  <v-app id="app">
    <v-card v-for="evaluation in evaluations" :key="evaluation.id">
      <v-list-item>
      <v-list-item-content>
        <v-list-item-title>{{ evaluation.title }}</v-list-item-title>
      </v-list-item-content>
    </v-list-item>
    </v-card> 
        <!--{{ evaluation.services }} : {{ evaluation.language }}： {{ evaluation.description }} -->
  </v-app> 
</template>

<script>
import axios from 'axios';

export default {
  data: function() {
    return {
      evaluations: "evaluations"
    }
  },
  mounted() {
    this.setEvaluation();
  },
  methods: {
    setEvaluation: function () {
      axios.get('/api/evaluations')
      .then(response => (
        this.evaluations = response.data
      ))
    }
  }
}
</script>
