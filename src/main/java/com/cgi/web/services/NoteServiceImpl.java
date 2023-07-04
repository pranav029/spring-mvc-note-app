package com.cgi.web.services;

import com.cgi.web.entities.Note;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import javax.transaction.Transactional;
import java.util.List;

@Component
public class NoteServiceImpl implements NoteService {
    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    @Transactional
    public void addNote(Note note) {
        hibernateTemplate.save(note);
    }

    @Override
    @Transactional
    public void deleteNote(Note note) {
        hibernateTemplate.delete(note);
    }

    @Override
    @Transactional
    public List<Note> getAllNotes() {
        List<Note> notes = hibernateTemplate.loadAll(Note.class);
        return notes;
    }
}
