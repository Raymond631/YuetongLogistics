package cn.tdsmy.fleet.service;

import cn.tdsmy.fleet.beans.Contact;
import cn.tdsmy.fleet.mapper.ContactMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ContactService {
    @Autowired
    private ContactMapper contactMapper;

    public void bind(int truckId, int driverId) {
        contactMapper.insertContact(truckId, driverId);
    }

    public void unbind(int contactId) {
        contactMapper.deleteContact(contactId);
    }

    public List<Contact> getContactList(int contactId) {
        return contactMapper.selectContact(contactId);
    }
}
