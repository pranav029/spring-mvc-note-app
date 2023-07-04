package com.cgi.web.services;


import com.cgi.web.entities.Note;

import java.util.List;

public interface NoteService {
    void addNote(Note note);

    void deleteNote(Note note);

    List<Note> getAllNotes();
}
