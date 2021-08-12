import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sqfentity/sqfentity.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';

part 'sqliteModel.g.dart';

const accountTable = SqfEntityTable(tableName: 'account', fields: [
  SqfEntityField('id', DbType.text, isPrimaryKeyField: true),
  SqfEntityField('email', DbType.text),
  SqfEntityField('name', DbType.text),
  SqfEntityField('photoUrl', DbType.text),
]);

const peopleTable = SqfEntityTable(tableName: 'people', fields: [
  SqfEntityField('name', DbType.text, isPrimaryKeyField: true),
  SqfEntityField('height', DbType.text),
  SqfEntityField('mass', DbType.text),
  SqfEntityField('hairColor', DbType.text),
  SqfEntityField('skinColor', DbType.text),
  SqfEntityField('eyeColor', DbType.text),
  SqfEntityField('birthYear', DbType.text),
  SqfEntityField('gender', DbType.text),
  SqfEntityField('created', DbType.text),
  SqfEntityField('edited', DbType.text),
]);

const seqIdentity = SqfEntitySequence(
  sequenceName: 'identity',
);

@SqfEntityBuilder(dbModel)
const dbModel = SqfEntityModel(
    modelName: 'StarwarsDBModel',
    databaseName: 'star.db',
    databaseTables: [accountTable, peopleTable],
    sequences: [seqIdentity],
    bundledDatabasePath: null);
