# README

This is the take home project for the interview process at Rugiet.

## Setup

1. Clone the repository
2. Run `bundle install`
3. Run `rails db:migrate`
4. Run `rails db:seed`
5. Run `rails s`
6. Open your browser and navigate to `http://localhost:3000`

## The Application

The application is a small extract of our main application. It's a part of the messaging system between users and doctors.
Users with active orders leverage the chat system to ask their doctor questions, ask for changes, and to perform refills.

Whilst this application is not representative of our main application, performing the requested task will expose you to the
same kinds of challenges you'll face in the real application.

### Login As User

Email: user@example.com
Password: Password1!

### Login As Doctor

Email: doctor@example.com
Password: Password1!

## Tips

Treat this task as if you were working a real ticket on our team. Think about how the code currently works and how you
would feel maintaining it and what you add to it 6 months from now.

We want to see how you think about code and how you write it. If you see opportunities to improve the code, please feel free to change it.

We're also looking for you to write tests, but not for the entire application. We're looking for you to write tests for the
code you write.

# Chat Visibility Feature - Test Plan

## Objective  
Validate the functionality of the new chat visibility rules to ensure:  
- Customer care users can view all messages.  
- Users and doctors have restricted visibility based on specified rules.  

---

## User Scenarios  

### As a User:  
- **Chat Initiation:** Users can initiate chats with customer care or a doctor.  
- **Message Visibility:** Users can view messages in chats where visibility is set to `user_customer_care` or `user_doctor`.  
- **Restricted Access:** Users cannot view messages in chats with `doctor_customer_care` visibility.  

### As a Doctor:  
- **Chat Initiation and Response:** Doctors can initiate chats with customer care or respond to user chats.  
- **Message Visibility:** Doctors can view messages in chats with `user_doctor` or `doctor_customer_care` visibility.  
- **Restricted Access:** Doctors cannot view messages in chats with `user_customer_care` visibility.  

### As a Customer Care User:  
- **Chat Initiation:** Customer care users can initiate chats with users or doctors.  
- **Message Access:** Customer care users can view all messages, regardless of visibility settings.  

---

## Functional Tests  

### Chat Creation  
- Verify chats are created with the correct visibility settings (`user_customer_care`, `user_doctor`, `doctor_customer_care`).  
- Ensure participants are added correctly based on their roles during chat creation.  

### Message Viewing  
- Test messages are displayed in chronological order (`created_at`).  
- Confirm role-based visibility rules are enforced.  

### Security and Access Control  
- Test unauthorized access to restricted chats triggers appropriate errors or redirects.  
- Ensure visibility restrictions cannot be bypassed through direct URL access or API requests.  

---

## Edge Cases  

### Role Verification  
- Confirm proper behavior for users with missing or unrecognized roles.  
- Ensure access control remains consistent if chat visibility or participant lists are modified.  

### Data Integrity  
- Verify chats retain participant roles and visibility settings after updates.  
- Confirm no data is exposed across restricted visibility settings.  

---

## Performance Checks  
- Test chat pagination for smooth operation across roles.  
- Validate performance when loading messages for large chats.  

---

## Regression Tests  
- Ensure core chat functionalities, such as creating and sending messages, work without issues.  
- Verify role interactions remain unaffected in other application areas.  

---

## UI/UX Tests  
- Confirm the UI dynamically updates to reflect role-based visibility restrictions.  
- Verify the chat interface shows relevant labels for user and doctor interactions with customer care.  

---

## Acceptance Criteria  
- All outlined tests must pass.  
- No unauthorized data should be visible based on role restrictions.  
- The chat creation and messaging process should remain seamless and user-friendly.  

---

## Testing Environments  
- **Browsers:** Chrome, Firefox, Safari, Edge  
- **Devices:** Desktop, tablet, mobile  

---

## Test Data  
- Users with `user`, `doctor`, and `customer_care` roles.  
- Orders linked to users and doctors.  
- Pre-existing chats with diverse visibility configurations.  
