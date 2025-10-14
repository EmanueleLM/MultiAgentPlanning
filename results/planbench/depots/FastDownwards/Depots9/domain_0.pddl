(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types slot room person equipment meeting)

  (:predicates
    (slot ?s - slot)
    (room ?r - room)
    (person ?p - person)
    (equipment ?e - equipment)
    (meeting ?m - meeting)

    (free ?s - slot)                      ; slot is free (not yet reserved)
    (room_free ?r - room ?s - slot)       ; room r free at slot s
    (booked ?r - room ?s - slot)          ; room r booked at slot s
    (reserved_for ?m - meeting ?s - slot) ; meeting m reserved at slot s

    (available ?p - person ?s - slot)     ; person p is available at slot s
    (presenter_assigned ?p - person ?m - meeting) ; person p is assigned presenter for meeting m

    (invite_sent ?m - meeting ?p - person ?s - slot) ; invite for meeting m to person p for slot s sent
    (confirmed ?p - person ?m - meeting)  ; person p confirmed attendance for meeting m

    (equipment_free ?e - equipment ?s - slot) ; equipment e free at slot s
    (equipment_set ?e - equipment ?s - slot)  ; equipment e set up at slot s

    (meeting_scheduled ?m - meeting ?s - slot) ; meeting m is scheduled at slot s
  )

  ;; 1) Reserve a slot by booking a room for a meeting.
  (:action reserve_slot
     :parameters (?room1 - room ?slot1 - slot ?meet1 - meeting)
     :precondition (and
       (room ?room1)
       (slot ?slot1)
       (meeting ?meet1)
       (room_free ?room1 ?slot1)
       (free ?slot1)
     )
     :effect (and
       (booked ?room1 ?slot1)
       (reserved_for ?meet1 ?slot1)
       (not (free ?slot1))
       (not (room_free ?room1 ?slot1))
     )
  )

  ;; 2) Assign a presenter who must be available at the reserved slot.
  (:action assign_presenter
     :parameters (?pers1 - person ?meet2 - meeting ?slot2 - slot)
     :precondition (and
       (person ?pers1)
       (meeting ?meet2)
       (slot ?slot2)
       (reserved_for ?meet2 ?slot2)
       (available ?pers1 ?slot2)
     )
     :effect (and
       (presenter_assigned ?pers1 ?meet2)
       (not (available ?pers1 ?slot2))
     )
  )

  ;; 3) Send an invite to an attendee for the meeting at a specific slot. Requires a presenter already assigned.
  (:action send_invite
     :parameters (?meet3 - meeting ?pers2 - person ?attendee1 - person ?slot3 - slot)
     :precondition (and
       (meeting ?meet3)
       (person ?pers2)
       (person ?attendee1)
       (slot ?slot3)
       (reserved_for ?meet3 ?slot3)
       (presenter_assigned ?pers2 ?meet3)
     )
     :effect (and
       (invite_sent ?meet3 ?attendee1 ?slot3)
     )
  )

  ;; 4) Attendee confirms attendance if they were invited and are available at that slot.
  (:action confirm_attendance
     :parameters (?attendee2 - person ?meet4 - meeting ?slot4 - slot)
     :precondition (and
       (person ?attendee2)
       (meeting ?meet4)
       (slot ?slot4)
       (invite_sent ?meet4 ?attendee2 ?slot4)
       (available ?attendee2 ?slot4)
     )
     :effect (and
       (confirmed ?attendee2 ?meet4)
     )
  )

  ;; 5) Set up required equipment at the reserved slot.
  (:action setup_equipment
     :parameters (?equip1 - equipment ?slot5 - slot ?meet5 - meeting)
     :precondition (and
       (equipment ?equip1)
       (slot ?slot5)
       (meeting ?meet5)
       (equipment_free ?equip1 ?slot5)
       (reserved_for ?meet5 ?slot5)
     )
     :effect (and
       (equipment_set ?equip1 ?slot5)
       (not (equipment_free ?equip1 ?slot5))
     )
  )

  ;; 6) Finalize the meeting once room, presenter, equipment and confirmations for both participants exist.
  ;; Note: This action is parameterized with two participants so the domain enforces confirmation of both explicitly.
  (:action finalize_meeting
     :parameters (?meet6 - meeting ?slot6 - slot ?person1 - person ?person2 - person ?room2 - room ?equip2 - equipment)
     :precondition (and
       (meeting ?meet6)
       (slot ?slot6)
       (person ?person1)
       (person ?person2)
       (room ?room2)
       (equipment ?equip2)

       (reserved_for ?meet6 ?slot6)
       (presenter_assigned ?person1 ?meet6)
       (confirmed ?person1 ?meet6)
       (confirmed ?person2 ?meet6)
       (equipment_set ?equip2 ?slot6)
       (booked ?room2 ?slot6)
     )
     :effect (and
       (meeting_scheduled ?meet6 ?slot6)
     )
  )
)