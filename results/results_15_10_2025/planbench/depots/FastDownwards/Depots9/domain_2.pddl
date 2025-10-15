(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types slot room person equipment meeting)

  (:predicates
    (free ?s - slot)
    (room_free ?r - room ?s - slot)
    (booked ?r - room ?s - slot)
    (reserved_for ?m - meeting ?s - slot)
    (available ?p - person ?s - slot)
    (presenter_assigned ?p - person ?m - meeting)
    (invite_sent ?m - meeting ?p - person ?s - slot)
    (confirmed ?p - person ?m - meeting)
    (equipment_free ?e - equipment ?s - slot)
    (equipment_set ?e - equipment ?s - slot)
    (meeting_scheduled ?m - meeting ?s - slot)
  )

  (:action reserve_slot
     :parameters (?room1 - room ?slot1 - slot ?meet1 - meeting)
     :precondition (and
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

  (:action assign_presenter
     :parameters (?pers1 - person ?meet2 - meeting ?slot2 - slot)
     :precondition (and
       (reserved_for ?meet2 ?slot2)
       (available ?pers1 ?slot2)
     )
     :effect (and
       (presenter_assigned ?pers1 ?meet2)
       (not (available ?pers1 ?slot2))
     )
  )

  (:action send_invite
     :parameters (?meet3 - meeting ?pers2 - person ?attendee1 - person ?slot3 - slot)
     :precondition (and
       (reserved_for ?meet3 ?slot3)
       (presenter_assigned ?pers2 ?meet3)
     )
     :effect (and
       (invite_sent ?meet3 ?attendee1 ?slot3)
     )
  )

  (:action confirm_attendance
     :parameters (?attendee2 - person ?meet4 - meeting ?slot4 - slot)
     :precondition (and
       (invite_sent ?meet4 ?attendee2 ?slot4)
       (available ?attendee2 ?slot4)
     )
     :effect (and
       (confirmed ?attendee2 ?meet4)
     )
  )

  (:action setup_equipment
     :parameters (?equip1 - equipment ?slot5 - slot ?meet5 - meeting)
     :precondition (and
       (equipment_free ?equip1 ?slot5)
       (reserved_for ?meet5 ?slot5)
     )
     :effect (and
       (equipment_set ?equip1 ?slot5)
       (not (equipment_free ?equip1 ?slot5))
     )
  )

  (:action finalize_meeting
     :parameters (?meet6 - meeting ?slot6 - slot ?person1 - person ?person2 - person ?room2 - room ?equip2 - equipment)
     :precondition (and
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