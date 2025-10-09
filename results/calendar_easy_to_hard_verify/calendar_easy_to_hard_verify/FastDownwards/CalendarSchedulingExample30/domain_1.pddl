(define (domain calendar-scheduling)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types participant slot)
  (:predicates
    (free ?p - participant ?s - slot)
    (scheduled ?s - slot))
  (:action schedule-s09_00
    :parameters ()
    :precondition (and (not (scheduled s09_00)) (free eric s09_00) (free jeremy s09_00) (free joe s09_00) (free brian s09_00) (free brittany s09_00) (free julia s09_00))
    :effect (and (scheduled s09_00)))
  (:action schedule-s09_30
    :parameters ()
    :precondition (and (not (scheduled s09_30)) (free eric s09_30) (free jeremy s09_30) (free joe s09_30) (free brian s09_30) (free brittany s09_30) (free julia s09_30))
    :effect (and (scheduled s09_30)))
  (:action schedule-s10_00
    :parameters ()
    :precondition (and (not (scheduled s10_00)) (free eric s10_00) (free jeremy s10_00) (free joe s10_00) (free brian s10_00) (free brittany s10_00) (free julia s10_00))
    :effect (and (scheduled s10_00)))
  (:action schedule-s10_30
    :parameters ()
    :precondition (and (not (scheduled s10_30)) (free eric s10_30) (free jeremy s10_30) (free joe s10_30) (free brian s10_30) (free brittany s10_30) (free julia s10_30))
    :effect (and (scheduled s10_30)))
  (:action schedule-s11_00
    :parameters ()
    :precondition (and (not (scheduled s11_00)) (free eric s11_00) (free jeremy s11_00) (free joe s11_00) (free brian s11_00) (free brittany s11_00) (free julia s11_00))
    :effect (and (scheduled s11_00)))
  (:action schedule-s11_30
    :parameters ()
    :precondition (and (not (scheduled s11_30)) (free eric s11_30) (free jeremy s11_30) (free joe s11_30) (free brian s11_30) (free brittany s11_30) (free julia s11_30))
    :effect (and (scheduled s11_30)))
  (:action schedule-s12_00
    :parameters ()
    :precondition (and (not (scheduled s12_00)) (free eric s12_00) (free jeremy s12_00) (free joe s12_00) (free brian s12_00) (free brittany s12_00) (free julia s12_00))
    :effect (and (scheduled s12_00)))
  (:action schedule-s12_30
    :parameters ()
    :precondition (and (not (scheduled s12_30)) (free eric s12_30) (free jeremy s12_30) (free joe s12_30) (free brian s12_30) (free brittany s12_30) (free julia s12_30))
    :effect (and (scheduled s12_30)))
  (:action schedule-s13_00
    :parameters ()
    :precondition (and (not (scheduled s13_00)) (free eric s13_00) (free jeremy s13_00) (free joe s13_00) (free brian s13_00) (free brittany s13_00) (free julia s13_00))
    :effect (and (scheduled s13_00)))
  (:action schedule-s13_30
    :parameters ()
    :precondition (and (not (scheduled s13_30)) (free eric s13_30) (free jeremy s13_30) (free joe s13_30) (free brian s13_30) (free brittany s13_30) (free julia s13_30))
    :effect (and (scheduled s13_30)))
  (:action schedule-s14_00
    :parameters ()
    :precondition (and (not (scheduled s14_00)) (free eric s14_00) (free jeremy s14_00) (free joe s14_00) (free brian s14_00) (free brittany s14_00) (free julia s14_00))
    :effect (and (scheduled s14_00)))
  (:action schedule-s14_30
    :parameters ()
    :precondition (and (not (scheduled s14_30)) (free eric s14_30) (free jeremy s14_30) (free joe s14_30) (free brian s14_30) (free brittany s14_30) (free julia s14_30))
    :effect (and (scheduled s14_30)))
  (:action schedule-s15_00
    :parameters ()
    :precondition (and (not (scheduled s15_00)) (free eric s15_00) (free jeremy s15_00) (free joe s15_00) (free brian s15_00) (free brittany s15_00) (free julia s15_00))
    :effect (and (scheduled s15_00)))
  (:action schedule-s15_30
    :parameters ()
    :precondition (and (not (scheduled s15_30)) (free eric s15_30) (free jeremy s15_30) (free joe s15_30) (free brian s15_30) (free brittany s15_30) (free julia s15_30))
    :effect (and (scheduled s15_30)))
  (:action schedule-s16_00
    :parameters ()
    :precondition (and (not (scheduled s16_00)) (free eric s16_00) (free jeremy s16_00) (free joe s16_00) (free brian s16_00) (free brittany s16_00) (free julia s16_00))
    :effect (and (scheduled s16_00)))
  (:action schedule-s16_30
    :parameters ()
    :precondition (and (not (scheduled s16_30)) (free eric s16_30) (free jeremy s16_30) (free joe s16_30) (free brian s16_30) (free brittany s16_30) (free julia s16_30))
    :effect (and (scheduled s16_30)))
)