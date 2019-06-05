'use strict';

const express = require('express');
const router = express.Router();
var mysql = require('mysql');
var config = require('../config');
var connection = require('../services/connection');

const db = connection.create_connection();

//Menu Page/view
router.get('/menu', (req, res) => res.render('dashboard', {

    error: ''
}));