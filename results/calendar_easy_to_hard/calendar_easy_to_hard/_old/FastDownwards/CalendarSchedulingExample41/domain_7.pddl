(define (domain integrated-meeting-scheduling)
  (:requirements :typing :negative-preconditions :strips)
  (:types slot person)
  (:predicates
    (free ?p - person ?s - slot)
    (preferred ?p - person ?s - slot)
    (confirmed ?p - person ?s - slot)
    (has-confirmed ?p - person)
    (finalized)
    (scheduled ?s - slot)
  )

  (:action confirm-evelyn-preferred
    :parameters (?s - slot)
    :precondition (and (free evelyn ?s) (preferred evelyn ?s) (not (has-confirmed evelyn)) (not (finalized)))
    :effect (and (confirmed evelyn ?s) (has-confirmed evelyn))
  )

  (:action confirm-evelyn-nonpreferred
    :parameters (?s - slot)
    :precondition (and (free evelyn ?s) (not (preferred evelyn ?s)) (not (has-confirmed evelyn)) (not (finalized)))
    :effect (and (confirmed evelyn ?s) (has-confirmed evelyn))
  )

  (:action confirm-roy-preferred
    :parameters (?s - slot)
    :precondition (and (free roy ?s) (preferred roy ?s) (not (has-confirmed roy)) (not (finalized)))
    :effect (and (confirmed roy ?s) (has-confirmed roy))
  )

  (:action confirm-roy-nonpreferred
    :parameters (?s - slot)
    :precondition (and (free roy ?s) (not (preferred roy ?s)) (not (has-confirmed roy)) (not (finalized)))
    :effect (and (confirmed roy ?s) (has-confirmed roy))
  )

  (:action confirm-billy-preferred
    :parameters (?s - slot)
    :precondition (and (free billy ?s) (preferred billy ?s) (not (has-confirmed billy)) (not (finalized)))
    :effect (and (confirmed billy ?s) (has-confirmed billy))
  )

  (:action confirm-billy-nonpreferred
    :parameters (?s - slot)
    :precondition (and (free billy ?s) (not (preferred billy ?s)) (not (has-confirmed billy)) (not (finalized)))
    :effect (and (confirmed billy ?s) (has-confirmed billy))
  )

  (:action confirm-gregory-preferred
    :parameters (?s - slot)
    :precondition (and (free gregory ?s) (preferred gregory ?s) (not (has-confirmed gregory)) (not (finalized)))
    :effect (and (confirmed gregory ?s) (has-confirmed gregory))
  )

  (:action confirm-gregory-nonpreferred
    :parameters (?s - slot)
    :precondition (and (free gregory ?s) (not (preferred gregory ?s)) (not (has-confirmed gregory)) (not (finalized)))
    :effect (and (confirmed gregory ?s) (has-confirmed gregory))
  )

  (:action confirm-vincent-preferred
    :parameters (?s - slot)
    :precondition (and (free vincent ?s) (preferred vincent ?s) (not (has-confirmed vincent)) (not (finalized)))
    :effect (and (confirmed vincent ?s) (has-confirmed vincent))
  )

  (:action confirm-vincent-nonpreferred
    :parameters (?s - slot)
    :precondition (and (free vincent ?s) (not (preferred vincent ?s)) (not (has-confirmed vincent)) (not (finalized)))
    :effect (and (confirmed vincent ?s) (has-confirmed vincent))
  )

  (:action confirm-philip-preferred
    :parameters (?s - slot)
    :precondition (and (free philip ?s) (preferred philip ?s) (not (has-confirmed philip)) (not (finalized)))
    :effect (and (confirmed philip ?s) (has-confirmed philip))
  )

  (:action confirm-philip-nonpreferred
    :parameters (?s - slot)
    :precondition (and (free philip ?s) (not (preferred philip ?s)) (not (has-confirmed philip)) (not (finalized)))
    :effect (and (confirmed philip ?s) (has-confirmed philip))
  )

  (:action confirm-william-preferred
    :parameters (?s - slot)
    :precondition (and (free william ?s) (preferred william ?s) (not (has-confirmed william)) (not (finalized)))
    :effect (and (confirmed william ?s) (has-confirmed william))
  )

  (:action confirm-william-nonpreferred
    :parameters (?s - slot)
    :precondition (and (free william ?s) (not (preferred william ?s)) (not (has-confirmed william)) (not (finalized)))
    :effect (and (confirmed william ?s) (has-confirmed william))
  )

  (:action finalize
    :parameters (?s - slot)
    :precondition (and
      (confirmed evelyn ?s)
      (confirmed roy ?s)
      (confirmed billy ?s)
      (confirmed gregory ?s)
      (confirmed vincent ?s)
      (confirmed philip ?s)
      (confirmed william ?s)
      (not (finalized))
    )
    :effect (and (finalized) (scheduled ?s))
  )
)