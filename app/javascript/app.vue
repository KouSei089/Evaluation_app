<template>
  <v-app id="app">
  <v-form v-model="valid">
    <v-container>
      <v-row>
        <v-col cols="12" md="4">
          <v-text-field
            v-model="title"
            label="Title"
            required
          ></v-text-field>
        </v-col>

        <v-col cols="12" md="4">
          <v-text-field
            v-model="services"
            label="Services"
            required
          ></v-text-field>
        </v-col>

        <v-col cols="12" md="4">
          <v-text-field
            v-model="language"
            label="Lamguage"
            required
          ></v-text-field>
        </v-col>

        <v-col cols="12" md="4">
          <v-text-field
            v-model="description"
            label="Description"
            required
          ></v-text-field>
        </v-col>
      </v-row>
      <v-btn @click="addEvaluation">POST</v-btn>
      <v-btn>CANCEL</v-btn>
    </v-container>
  </v-form>

    <!--<v-autocomplete v-model="title" label="Title">
    </v-autocomplete>
    <v-autocomplete v-model="services" label="Services">
    </v-autocomplete>
    <v-autocomplete v-model="language" label="Language">
    </v-autocomplete>
    <v-autocomplete v-model="description" label="Description">
    </v-autocomplete>
    <v-btn @click="addEvaluation">POST</v-btn>
    <v-btn>CANCEL</v-btn> -->

    <v-card v-for="evaluation in evaluations" :key="evaluation.id">
      <v-list-item>
      <v-list-item-content>
        <v-list-item-title>{{ evaluation.title }}</v-list-item-title>
      </v-list-item-content>
      </v-list-item>
      <v-list-item>
        <v-list-item-content>
          <v-list-item-title>{{ evaluation.services }}</v-list-item-title>
        </v-list-item-content>
      </v-list-item>
      <v-list-item>
        <v-list-item-content>
          <v-list-item-title>{{ evaluation.language }}</v-list-item-title>
        </v-list-item-content>
      </v-list-item>
      <v-list-item>
        <v-list-item-content>
          <v-list-item-title>{{ evaluation.description }}</v-list-item-title>
        </v-list-item-content>
      </v-list-item>
    </v-card> 
  </v-app> 
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      evaluations: "evaluations",
      valid: false,
      title: '',
      services: '',
      language: '',
      description: '',
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
    },
    addEvaluation: function() {
      axios.post('/api/evaluations', {title: this.title, services: this.services, language: this.language, description: this.description})
      .then( response => (
        this.setEvaluation()
      ));
    }
  }
}
</script>
