(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :adl :action-costs)
  (:types person timeslot)
  (:predicates
    (slot ?t - timeslot)
    (available ?p - person ?t - timeslot)
    (meeting-scheduled)
    (meeting-start ?t - timeslot)
    (attending ?p - person ?t - timeslot)
  )

  (:action schedule-s09_00
    :precondition (and
      (slot s09_00)
      (not (meeting-scheduled))
      (available Diane s09_00)
      (available Helen s09_00)
      (available Arthur s09_00)
      (available Ethan s09_00)
      (available Beverly s09_00)
      (available Deborah s09_00)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-start s09_00)
      (attending Diane s09_00)
      (attending Helen s09_00)
      (attending Arthur s09_00)
      (attending Ethan s09_00)
      (attending Beverly s09_00)
      (attending Deborah s09_00)
    )
    :cost 0
  )

  (:action schedule-s09_30
    :precondition (and
      (slot s09_30)
      (not (meeting-scheduled))
      (available Diane s09_30)
      (available Helen s09_30)
      (available Arthur s09_30)
      (available Ethan s09_30)
      (available Beverly s09_30)
      (available Deborah s09_30)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-start s09_30)
      (attending Diane s09_30)
      (attending Helen s09_30)
      (attending Arthur s09_30)
      (attending Ethan s09_30)
      (attending Beverly s09_30)
      (attending Deborah s09_30)
    )
    :cost 1
  )

  (:action schedule-s10_00
    :precondition (and
      (slot s10_00)
      (not (meeting-scheduled))
      (available Diane s10_00)
      (available Helen s10_00)
      (available Arthur s10_00)
      (available Ethan s10_00)
      (available Beverly s10_00)
      (available Deborah s10_00)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-start s10_00)
      (attending Diane s10_00)
      (attending Helen s10_00)
      (attending Arthur s10_00)
      (attending Ethan s10_00)
      (attending Beverly s10_00)
      (attending Deborah s10_00)
    )
    :cost 2
  )

  (:action schedule-s10_30
    :precondition (and
      (slot s10_30)
      (not (meeting-scheduled))
      (available Diane s10_30)
      (available Helen s10_30)
      (available Arthur s10_30)
      (available Ethan s10_30)
      (available Beverly s10_30)
      (available Deborah s10_30)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-start s10_30)
      (attending Diane s10_30)
      (attending Helen s10_30)
      (attending Arthur s10_30)
      (attending Ethan s10_30)
      (attending Beverly s10_30)
      (attending Deborah s10_30)
    )
    :cost 3
  )

  (:action schedule-s11_00
    :precondition (and
      (slot s11_00)
      (not (meeting-scheduled))
      (available Diane s11_00)
      (available Helen s11_00)
      (available Arthur s11_00)
      (available Ethan s11_00)
      (available Beverly s11_00)
      (available Deborah s11_00)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-start s11_00)
      (attending Diane s11_00)
      (attending Helen s11_00)
      (attending Arthur s11_00)
      (attending Ethan s11_00)
      (attending Beverly s11_00)
      (attending Deborah s11_00)
    )
    :cost 4
  )

  (:action schedule-s11_30
    :precondition (and
      (slot s11_30)
      (not (meeting-scheduled))
      (available Diane s11_30)
      (available Helen s11_30)
      (available Arthur s11_30)
      (available Ethan s11_30)
      (available Beverly s11_30)
      (available Deborah s11_30)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-start s11_30)
      (attending Diane s11_30)
      (attending Helen s11_30)
      (attending Arthur s11_30)
      (attending Ethan s11_30)
      (attending Beverly s11_30)
      (attending Deborah s11_30)
    )
    :cost 5
  )

  (:action schedule-s12_00
    :precondition (and
      (slot s12_00)
      (not (meeting-scheduled))
      (available Diane s12_00)
      (available Helen s12_00)
      (available Arthur s12_00)
      (available Ethan s12_00)
      (available Beverly s12_00)
      (available Deborah s12_00)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-start s12_00)
      (attending Diane s12_00)
      (attending Helen s12_00)
      (attending Arthur s12_00)
      (attending Ethan s12_00)
      (attending Beverly s12_00)
      (attending Deborah s12_00)
    )
    :cost 6
  )

  (:action schedule-s12_30
    :precondition (and
      (slot s12_30)
      (not (meeting-scheduled))
      (available Diane s12_30)
      (available Helen s12_30)
      (available Arthur s12_30)
      (available Ethan s12_30)
      (available Beverly s12_30)
      (available Deborah s12_30)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-start s12_30)
      (attending Diane s12_30)
      (attending Helen s12_30)
      (attending Arthur s12_30)
      (attending Ethan s12_30)
      (attending Beverly s12_30)
      (attending Deborah s12_30)
    )
    :cost 7
  )

  (:action schedule-s13_00
    :precondition (and
      (slot s13_00)
      (not (meeting-scheduled))
      (available Diane s13_00)
      (available Helen s13_00)
      (available Arthur s13_00)
      (available Ethan s13_00)
      (available Beverly s13_00)
      (available Deborah s13_00)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-start s13_00)
      (attending Diane s13_00)
      (attending Helen s13_00)
      (attending Arthur s13_00)
      (attending Ethan s13_00)
      (attending Beverly s13_00)
      (attending Deborah s13_00)
    )
    :cost 8
  )

  (:action schedule-s13_30
    :precondition (and
      (slot s13_30)
      (not (meeting-scheduled))
      (available Diane s13_30)
      (available Helen s13_30)
      (available Arthur s13_30)
      (available Ethan s13_30)
      (available Beverly s13_30)
      (available Deborah s13_30)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-start s13_30)
      (attending Diane s13_30)
      (attending Helen s13_30)
      (attending Arthur s13_30)
      (attending Ethan s13_30)
      (attending Beverly s13_30)
      (attending Deborah s13_30)
    )
    :cost 9
  )

  (:action schedule-s14_00
    :precondition (and
      (slot s14_00)
      (not (meeting-scheduled))
      (available Diane s14_00)
      (available Helen s14_00)
      (available Arthur s14_00)
      (available Ethan s14_00)
      (available Beverly s14_00)
      (available Deborah s14_00)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-start s14_00)
      (attending Diane s14_00)
      (attending Helen s14_00)
      (attending Arthur s14_00)
      (attending Ethan s14_00)
      (attending Beverly s14_00)
      (attending Deborah s14_00)
    )
    :cost 10
  )

  (:action schedule-s14_30
    :precondition (and
      (slot s14_30)
      (not (meeting-scheduled))
      (available Diane s14_30)
      (available Helen s14_30)
      (available Arthur s14_30)
      (available Ethan s14_30)
      (available Beverly s14_30)
      (available Deborah s14_30)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-start s14_30)
      (attending Diane s14_30)
      (attending Helen s14_30)
      (attending Arthur s14_30)
      (attending Ethan s14_30)
      (attending Beverly s14_30)
      (attending Deborah s14_30)
    )
    :cost 11
  )

  (:action schedule-s15_00
    :precondition (and
      (slot s15_00)
      (not (meeting-scheduled))
      (available Diane s15_00)
      (available Helen s15_00)
      (available Arthur s15_00)
      (available Ethan s15_00)
      (available Beverly s15_00)
      (available Deborah s15_00)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-start s15_00)
      (attending Diane s15_00)
      (attending Helen s15_00)
      (attending Arthur s15_00)
      (attending Ethan s15_00)
      (attending Beverly s15_00)
      (attending Deborah s15_00)
    )
    :cost 12
  )

  (:action schedule-s15_30
    :precondition (and
      (slot s15_30)
      (not (meeting-scheduled))
      (available Diane s15_30)
      (available Helen s15_30)
      (available Arthur s15_30)
      (available Ethan s15_30)
      (available Beverly s15_30)
      (available Deborah s15_30)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-start s15_30)
      (attending Diane s15_30)
      (attending Helen s15_30)
      (attending Arthur s15_30)
      (attending Ethan s15_30)
      (attending Beverly s15_30)
      (attending Deborah s15_30)
    )
    :cost 13
  )

  (:action schedule-s16_00
    :precondition (and
      (slot s16_00)
      (not (meeting-scheduled))
      (available Diane s16_00)
      (available Helen s16_00)
      (available Arthur s16_00)
      (available Ethan s16_00)
      (available Beverly s16_00)
      (available Deborah s16_00)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-start s16_00)
      (attending Diane s16_00)
      (attending Helen s16_00)
      (attending Arthur s16_00)
      (attending Ethan s16_00)
      (attending Beverly s16_00)
      (attending Deborah s16_00)
    )
    :cost 14
  )

  (:action schedule-s16_30
    :precondition (and
      (slot s16_30)
      (not (meeting-scheduled))
      (available Diane s16_30)
      (available Helen s16_30)
      (available Arthur s16_30)
      (available Ethan s16_30)
      (available Beverly s16_30)
      (available Deborah s16_30)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-start s16_30)
      (attending Diane s16_30)
      (attending Helen s16_30)
      (attending Arthur s16_30)
      (attending Ethan s16_30)
      (attending Beverly s16_30)
      (attending Deborah s16_30)
    )
    :cost 15
  )

)