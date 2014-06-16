package com.psddev.brightspot.utils;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

import com.psddev.cms.db.Draft;
import com.psddev.cms.db.Schedule;
import com.psddev.dari.db.Query;
import com.psddev.dari.util.ObjectUtils;
import com.psddev.dari.util.Task;
import com.psddev.brightspot.Author;

public class AuthorImporter extends Task {

    private InputStream input;

    public AuthorImporter(InputStream input) {
        this.input = input;
    }

    @Override
    protected void doTask() throws Exception {

        BufferedReader in = new BufferedReader(new InputStreamReader(input));

        String line = null;

        while((line = in.readLine()) != null) {
            String[] fields = line.split(",");

            String name = fields[0];

            Author author = new Author();
            author.setName(name);
            author.save();

        }     
    }

}