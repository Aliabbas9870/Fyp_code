// class Assistant {
//   // Predefined questions and limited responses
//   final Map<String, String> _responses = {
//     'hello': 'Hello! Welcome to the Beauty App. How can I assist you?',
//     'what': 'How can I assist you?',
//     'what?': 'How can I assist you?',
//     'What?': 'How can I assist you?',
//     'ok': 'AnyThing Else?',
//     'Ok': 'AnyThing Else?',
//     'joke':"Joke?",
//     'developer':"Ali Abbas",
//     'name of creator':"Ali Abbas",
//     'who is ali abbas':"Ali Abbas develop this app",
//     'Thanks':"Welcome!",
//     'Thank you':"you are Welcome!",
//     'thanks':"you are Welcome!",
//     'payment':"payment offline",
//     'payment':"payment hand by hand",
//     'hello': 'Hello! Welcome to the Beauty App. How can I assist you?',
//     'hello': 'Hello! How can I assist you?',
//     'Hi': 'Hello! Welcome to the Beauty App. How can I assist you?',
//     'hi': 'Hello! Welcome to the Beauty App. How can I assist you?',
//     'hi': 'Hello! Welcome to the Beauty App.',
//     'how are you': 'I am your personal beauty assistant. Ready to help!',
//     'how are you?': 'I am your personal beauty assistant. Ready to help!',
//     'How are you?': 'I am your personal beauty assistant. Ready to help!',
//     'How are you': 'I am your personal beauty assistant. Ready to help!',
//     'what is your name?': 'I am your personal beauty assistant.',
//     'what can you do?': 'I can help you with salon services, timings, payment options, and more.',
//     'what can you do': 'I can help you with salon services, timings, payment options, and more.',
//     'what are the available salons?': 'We have several salons available in your area. Please check the app for details.',
//     'available salons?': 'We have several salons available in your area. Please check the app for details.',
//     'available salons': 'We have several salons available in your area. Please check the app for details.',
//     'are salons open on sunday?': 'Some salons are open on Sunday. Please check individual salon schedules.',
//     'open on sunday?': 'Some salons are open on Sunday. Please check individual salon schedules.',
//     'open on sunday': 'Some salons are open on Sunday. Please check individual salon schedules.',
//     'open on sunday': 'Some salons are open on Sunday. Please check individual salon schedules.',
//     'is payment available offline?': 'Yes, we accept both offline and online payments for your convenience.',
//     'what are the app timings?': 'The app services are available from 9 AM to 10 PM daily.',
//     'is online service available?': 'Yes, online services are available for bookings and consultations.',
//     'online service available?': 'Yes, online services are available for bookings and consultations.',
//     'online service available': 'Yes, online services are available for bookings and consultations.',
//     'is offline service available?': 'Yes, you can book offline services in the app and visit the salon.',
//     'is offline service available': 'Yes, you can book offline services in the app and visit the salon.',
//     'what is the contact for customer service?': 'For customer service, please contact Ali Abbas at aliab7357@gmail.com.',
//     'what services are available?': 'We offer haircuts, facials, manicures, pedicures, and more.',
//     'do you offer beauty consultations?': 'Yes, beauty consultations are available online. Book through the app.',
//     'are there any discounts?': 'Yes, we offer seasonal discounts. Please check the app for details.',
//     'can i book an appointment online?': 'Yes, you can easily book an appointment through the app.',
//     'do you offer membership?': 'Yes, we have membership options with special discounts for regular customers.',
//     'are there any packages available?': 'We have various beauty packages available. Check the app for details.',
//     'any packages available?': 'We have various beauty packages available. Check the app for details.',
//     'any packages available': 'We have various beauty packages available. Check the app for details.',
//     'is parking available at the salon?': 'Yes, most salons offer parking. Please check individual salon info.',
//     'do you have a loyalty program?': 'Yes, join our loyalty program and earn points with every visit.',
//     'do you have a program': 'Yes, join our loyalty program and earn points with every visit.',
//     'what are the salon working hours?': 'Most salons operate from 9 AM to 10 PM, but it varies by location.',
//     'can i get a haircut today?': 'Please check the app for the next available appointment slot.',
//     'is a hair spa service available?': 'Yes, hair spa services are available at select salons.',
//     'what is the cost of a facial?': 'Facial costs vary by salon and type. Check the app for price details.',
//     'do you offer bridal makeup?': 'Yes, we offer bridal makeup services. Please book in advance.',
//     'can i pay with credit card?': 'Yes, we accept credit card payments both online and offline.',
//     'is cash payment accepted?': 'Yes, cash payments are accepted at salons.',
//     'can i cancel my booking': 'Yes, you can cancel your booking up to 24 hours before the appointment.',
//     'are there any cancellation fees?': 'Cancellation fees may apply. Check the app for details.',
//     'how do i reschedule my appointment?': 'You can reschedule your appointment through the app.',
//     'can i book multiple services?': 'Yes, you can book multiple services at once.',
//     'is there a referral program?': 'Yes, refer friends and earn rewards.',
//     'do you have gift cards?': 'Yes, gift cards are available for purchase.',
//     'is waxing service available?': 'Yes, waxing services are available.',
//     'do you offer threading services?': 'Yes, threading services are available at select salons.',
//     'are men’s grooming services available?': 'Yes, we offer grooming services for men as well.',
//     'do you offer child-friendly services?': 'Yes, select salons offer child-friendly services.',
//     'are senior discounts available?': 'Yes, we offer special discounts for seniors.',
//     'can i book a massage service?': 'Yes, massage services are available in select salons.',
//     'is there a hairstylist recommendation?': 'You can check stylist profiles and reviews in the app.',
//     'do you offer hair coloring?': 'Yes, hair coloring services are available.',
//     'is nail art available?': 'Yes, nail art services are available at select salons.',
//     'do you have a mobile app?': 'Yes, the app is available for both iOS and Android.',
//     'how do i download the app?': 'You can download the app from the App Store or Google Play.',
//     'what are the salon safety measures?': 'All salons follow COVID-19 safety guidelines. Check the app for more details.',
//     'can i tip the stylist?': 'Yes, tipping is optional and can be done in cash or through the app.',
//     'do you offer hair treatments?': 'Yes, various hair treatments are available.',
//     'is makeup service available': 'Yes, makeup services are available at select salons.',
//     'how do i find salons near me?': 'You can find nearby salons by using the location filter in the app.',
//     'are walk-ins allowed?': 'Some salons allow walk-ins, but booking in advance is recommended.',
//     'can i get a refund': 'Refunds are available under certain conditions. Check the app for policies.',
//     'do you offer haircuts for children?': 'Yes, haircuts for children are available.',
//     'can i get a haircut on weekends?': 'Yes, most salons offer weekend services. Check the app for availability.',
//     'how long does a haircut take?': 'A haircut usually takes 30 to 45 minutes, depending on the style.',
//     'is there a hairstylist available now?': 'Check the app for real-time availability of hairstylists.',
//     'are there any salons open now?': 'Check the app for salons that are open at the moment.',
//     'do you offer laser hair removal?': 'Yes, laser hair removal is available at select salons.',
//     'can i book a facial online?': 'Yes, facials can be booked online through the app.',
//     'is there a booking fee?': 'No, there are no additional booking fees for online appointments.',
//     'how can i provide feedback': 'You can provide feedback directly in the app after your service.',
//     'do you offer spa services': 'Yes, spa services are available at select locations.',
//     'how do i contact customer support?': 'For customer support, contact Ali Abbas at aliab7357@gmail.com.',
//     'can i book a pedicure and manicure?': 'Yes, pedicure and manicure services are available.',
//     'are there mobile services available?': 'Yes, mobile beauty services are available at select locations.',
//     'is the app free to use': 'Yes, the app is free to download and use.',
//     'can i save my favorite salons?': 'Yes, you can save your favorite salons in the app.',
//     'how do i track my appointment?': 'You can track your appointment status in the app under “My Bookings”.',
//     'are there exclusive offers?': 'Yes, we offer exclusive deals for app users. Check the app for promotions.',
//     'do you offer skin treatments?': 'Yes, skin treatments are available at select salons.',
//     'can i pay with PayPal?': 'Yes, PayPal is accepted as a payment method.',
//     'is there a booking reminder?': 'Yes, you will receive a reminder before your appointment.',
//     'can i book for a group?': 'Yes, group bookings are available for certain services.',
//     'do you offer keratin treatments?': 'Yes, keratin treatments are available at select salons.',
//     'is there a refund policy?': 'Refunds are issued under specific conditions. Please refer to the app for details.',
//     'can i chat with customer support?': 'Yes, chat support is available within the app.',
//     'do you offer personalized recommendations?': 'Yes, we offer personalized beauty recommendations based on your preferences.',
//     'are beauty consultations free?': 'Yes, initial consultations are free. Charges apply for detailed services.',
//     'can i change my payment method?': 'Yes, you can update your payment method in the app settings.',
//     'do you offer hairstyling services?': 'Yes, hairstyling services are available at all partner salons.',
//     'is there a discount for first-time users?': 'Yes, first-time users enjoy a 10% discount on their first booking.',
//     'can i apply a coupon code?': 'Yes, coupon codes can be applied at checkout for discounts.',
//     'is threading painful?': 'Threading can cause slight discomfort, but it is generally painless.',
//     'do you offer blow-drying services?': 'Yes, blow-dry services are available for all hair types.',
//     'what’s the most popular service?': 'Haircuts and facials are among the most popular services.',
//     'can i change my appointment time?': 'Yes, you can change the appointment time up to 24 hours before.',
//     'what if i miss my appointment?': 'Please inform the salon in advance to avoid any cancellation charges.',
//     'are bridal packages available?': 'Yes, bridal packages are available. Book early to reserve your spot.',
//     'how do i leave a review?': 'You can leave a review after your service in the app.',
//     'how do i leave a review': 'You can leave a review after your service in the app.',
//     'do you offer skincare products?': 'Yes, you can purchase skincare products at participating salons.',
//     'can i book a barber through the app?': 'Yes, you can book a barber for men’s grooming services through the app.',
//     'how can i request a specific stylist?': 'You can request a specific stylist when booking your appointment in the app.',
//     'what if i have allergies?': 'Please inform the salon staff about any allergies before your service.',
//     'do you offer body treatments?': 'Yes, body treatments like scrubs and wraps are available at select salons.',
//     'can i see stylist reviews?': 'Yes, you can read reviews from other customers before booking.',
//     'can i see review': 'Yes, you can read reviews from other customers before booking.',
//     'help':'For customer support, contact Ali Abbas at aliab7357@gmail.com.',
//     'help me':'For customer support, contact Ali Abbas at aliab7357@gmail.com.',
//   };

//   String getResponse(String query) {
//     return _responses[query.toLowerCase()] ??
//         'Please contact Ali Abbas for more guidance on aliab7357@gmail.com.';
//   }
// }
