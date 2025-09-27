(define (domain schedule-meeting)
  (:requirements :typing :action-costs :equality)
  (:types participant slot meeting)
  (:constants
    amy jonathan brittany matthew catherine carl - participant
    slot-0900 slot-0930 slot-1000 slot-1030 slot-1100 slot-1130
    slot-1200 slot-1230 slot-1300 slot-1330 slot-1400 slot-1430
    slot-1500 slot-1530 slot-1600 slot-1630 - slot
  )
  (:predicates
    (available ?p - participant ?s - slot)
    (meeting-scheduled ?m - meeting)
    (scheduled-at ?m - meeting ?s - slot)
    (attends ?p - participant ?m - meeting)
  )

  (:action schedule-at-0900
    :parameters (?m - meeting)
    :precondition (and
      (available amy slot-0900) (available jonathan slot-0900)
      (available brittany slot-0900) (available matthew slot-0900)
      (available catherine slot-0900) (available carl slot-0900)
    )
    :effect (and
      (meeting-scheduled ?m)
      (scheduled-at ?m slot-0900)
      (attends amy ?m) (attends jonathan ?m) (attends brittany ?m)
      (attends matthew ?m) (attends catherine ?m) (attends carl ?m)
    )
    :cost 1
  )

  (:action schedule-at-0930
    :parameters (?m - meeting)
    :precondition (and
      (available amy slot-0930) (available jonathan slot-0930)
      (available brittany slot-0930) (available matthew slot-0930)
      (available catherine slot-0930) (available carl slot-0930)
    )
    :effect (and
      (meeting-scheduled ?m)
      (scheduled-at ?m slot-0930)
      (attends amy ?m) (attends jonathan ?m) (attends brittany ?m)
      (attends matthew ?m) (attends catherine ?m) (attends carl ?m)
    )
    :cost 2
  )

  (:action schedule-at-1000
    :parameters (?m - meeting)
    :precondition (and
      (available amy slot-1000) (available jonathan slot-1000)
      (available brittany slot-1000) (available matthew slot-1000)
      (available catherine slot-1000) (available carl slot-1000)
    )
    :effect (and
      (meeting-scheduled ?m)
      (scheduled-at ?m slot-1000)
      (attends amy ?m) (attends jonathan ?m) (attends brittany ?m)
      (attends matthew ?m) (attends catherine ?m) (attends carl ?m)
    )
    :cost 3
  )

  (:action schedule-at-1030
    :parameters (?m - meeting)
    :precondition (and
      (available amy slot-1030) (available jonathan slot-1030)
      (available brittany slot-1030) (available matthew slot-1030)
      (available catherine slot-1030) (available carl slot-1030)
    )
    :effect (and
      (meeting-scheduled ?m)
      (scheduled-at ?m slot-1030)
      (attends amy ?m) (attends jonathan ?m) (attends brittany ?m)
      (attends matthew ?m) (attends catherine ?m) (attends carl ?m)
    )
    :cost 4
  )

  (:action schedule-at-1100
    :parameters (?m - meeting)
    :precondition (and
      (available amy slot-1100) (available jonathan slot-1100)
      (available brittany slot-1100) (available matthew slot-1100)
      (available catherine slot-1100) (available carl slot-1100)
    )
    :effect (and
      (meeting-scheduled ?m)
      (scheduled-at ?m slot-1100)
      (attends amy ?m) (attends jonathan ?m) (attends brittany ?m)
      (attends matthew ?m) (attends catherine ?m) (attends carl ?m)
    )
    :cost 5
  )

  (:action schedule-at-1130
    :parameters (?m - meeting)
    :precondition (and
      (available amy slot-1130) (available jonathan slot-1130)
      (available brittany slot-1130) (available matthew slot-1130)
      (available catherine slot-1130) (available carl slot-1130)
    )
    :effect (and
      (meeting-scheduled ?m)
      (scheduled-at ?m slot-1130)
      (attends amy ?m) (attends jonathan ?m) (attends brittany ?m)
      (attends matthew ?m) (attends catherine ?m) (attends carl ?m)
    )
    :cost 6
  )

  (:action schedule-at-1200
    :parameters (?m - meeting)
    :precondition (and
      (available amy slot-1200) (available jonathan slot-1200)
      (available brittany slot-1200) (available matthew slot-1200)
      (available catherine slot-1200) (available carl slot-1200)
    )
    :effect (and
      (meeting-scheduled ?m)
      (scheduled-at ?m slot-1200)
      (attends amy ?m) (attends jonathan ?m) (attends brittany ?m)
      (attends matthew ?m) (attends catherine ?m) (attends carl ?m)
    )
    :cost 7
  )

  (:action schedule-at-1230
    :parameters (?m - meeting)
    :precondition (and
      (available amy slot-1230) (available jonathan slot-1230)
      (available brittany slot-1230) (available matthew slot-1230)
      (available catherine slot-1230) (available carl slot-1230)
    )
    :effect (and
      (meeting-scheduled ?m)
      (scheduled-at ?m slot-1230)
      (attends amy ?m) (attends jonathan ?m) (attends brittany ?m)
      (attends matthew ?m) (attends catherine ?m) (attends carl ?m)
    )
    :cost 8
  )

  (:action schedule-at-1300
    :parameters (?m - meeting)
    :precondition (and
      (available amy slot-1300) (available jonathan slot-1300)
      (available brittany slot-1300) (available matthew slot-1300)
      (available catherine slot-1300) (available carl slot-1300)
    )
    :effect (and
      (meeting-scheduled ?m)
      (scheduled-at ?m slot-1300)
      (attends amy ?m) (attends jonathan ?m) (attends brittany ?m)
      (attends matthew ?m) (attends catherine ?m) (attends carl ?m)
    )
    :cost 9
  )

  (:action schedule-at-1330
    :parameters (?m - meeting)
    :precondition (and
      (available amy slot-1330) (available jonathan slot-1330)
      (available brittany slot-1330) (available matthew slot-1330)
      (available catherine slot-1330) (available carl slot-1330)
    )
    :effect (and
      (meeting-scheduled ?m)
      (scheduled-at ?m slot-1330)
      (attends amy ?m) (attends jonathan ?m) (attends brittany ?m)
      (attends matthew ?m) (attends catherine ?m) (attends carl ?m)
    )
    :cost 10
  )

  (:action schedule-at-1400
    :parameters (?m - meeting)
    :precondition (and
      (available amy slot-1400) (available jonathan slot-1400)
      (available brittany slot-1400) (available matthew slot-1400)
      (available catherine slot-1400) (available carl slot-1400)
    )
    :effect (and
      (meeting-scheduled ?m)
      (scheduled-at ?m slot-1400)
      (attends amy ?m) (attends jonathan ?m) (attends brittany ?m)
      (attends matthew ?m) (attends catherine ?m) (attends carl ?m)
    )
    :cost 11
  )

  (:action schedule-at-1430
    :parameters (?m - meeting)
    :precondition (and
      (available amy slot-1430) (available jonathan slot-1430)
      (available brittany slot-1430) (available matthew slot-1430)
      (available catherine slot-1430) (available carl slot-1430)
    )
    :effect (and
      (meeting-scheduled ?m)
      (scheduled-at ?m slot-1430)
      (attends amy ?m) (attends jonathan ?m) (attends brittany ?m)
      (attends matthew ?m) (attends catherine ?m) (attends carl ?m)
    )
    :cost 12
  )

  (:action schedule-at-1500
    :parameters (?m - meeting)
    :precondition (and
      (available amy slot-1500) (available jonathan slot-1500)
      (available brittany slot-1500) (available matthew slot-1500)
      (available catherine slot-1500) (available carl slot-1500)
    )
    :effect (and
      (meeting-scheduled ?m)
      (scheduled-at ?m slot-1500)
      (attends amy ?m) (attends jonathan ?m) (attends brittany ?m)
      (attends matthew ?m) (attends catherine ?m) (attends carl ?m)
    )
    :cost 13
  )

  (:action schedule-at-1530
    :parameters (?m - meeting)
    :precondition (and
      (available amy slot-1530) (available jonathan slot-1530)
      (available brittany slot-1530) (available matthew slot-1530)
      (available catherine slot-1530) (available carl slot-1530)
    )
    :effect (and
      (meeting-scheduled ?m)
      (scheduled-at ?m slot-1530)
      (attends amy ?m) (attends jonathan ?m) (attends brittany ?m)
      (attends matthew ?m) (attends catherine ?m) (attends carl ?m)
    )
    :cost 14
  )

  (:action schedule-at-1600
    :parameters (?m - meeting)
    :precondition (and
      (available amy slot-1600) (available jonathan slot-1600)
      (available brittany slot-1600) (available matthew slot-1600)
      (available catherine slot-1600) (available carl slot-1600)
    )
    :effect (and
      (meeting-scheduled ?m)
      (scheduled-at ?m slot-1600)
      (attends amy ?m) (attends jonathan ?m) (attends brittany ?m)
      (attends matthew ?m) (attends catherine ?m) (attends carl ?m)
    )
    :cost 15
  )

  (:action schedule-at-1630
    :parameters (?m - meeting)
    :precondition (and
      (available amy slot-1630) (available jonathan slot-1630)
      (available brittany slot-1630) (available matthew slot-1630)
      (available catherine slot-1630) (available carl slot-1630)
    )
    :effect (and
      (meeting-scheduled ?m)
      (scheduled-at ?m slot-1630)
      (attends amy ?m) (attends jonathan ?m) (attends brittany ?m)
      (attends matthew ?m) (attends catherine ?m) (attends carl ?m)
    )
    :cost 16
  )
)