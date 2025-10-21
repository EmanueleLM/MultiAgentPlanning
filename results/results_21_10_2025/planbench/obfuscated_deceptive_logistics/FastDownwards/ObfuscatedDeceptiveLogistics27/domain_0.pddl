(define (domain mission_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types player analyst loc item zone)

  (:predicates
    (at_player ?p - player ?l - loc)
    (at_analyst ?a - analyst ?l - loc)
    (item_at ?it - item ?l - loc)
    (has ?p - player ?it - item)
    (mission_started ?p - player)
    (in_zone ?l - loc ?z - zone)
    (zone_restricted ?z - zone)
    (analyzed ?it - item)
    (approved ?it - item)
    (delivered ?it - item ?l - loc)
  )

  ;; Player starts their mission (must precede picking items)
  (:action start-mission
    :parameters (?p - player)
    :precondition (not (mission_started ?p))
    :effect (mission_started ?p)
  )

  ;; Player movement; forbidden to enter locations that belong to a restricted zone.
  (:action move-player
    :parameters (?p - player ?from - loc ?to - loc ?z - zone)
    :precondition (and (at_player ?p ?from) (in_zone ?to ?z) (not (zone_restricted ?z)))
    :effect (and (at_player ?p ?to) (not (at_player ?p ?from)))
  )

  ;; Analyst movement; analysts are also blocked from entering restricted zones.
  (:action move-analyst
    :parameters (?a - analyst ?from - loc ?to - loc ?z - zone)
    :precondition (and (at_analyst ?a ?from) (in_zone ?to ?z) (not (zone_restricted ?z)))
    :effect (and (at_analyst ?a ?to) (not (at_analyst ?a ?from)))
  )

  ;; Player picks up an item available at their location; requires mission started.
  (:action pick-item
    :parameters (?p - player ?it - item ?l - loc)
    :precondition (and (at_player ?p ?l) (item_at ?it ?l) (mission_started ?p) (not (has ?p ?it)))
    :effect (and (has ?p ?it) (not (item_at ?it ?l)))
  )

  ;; Player delivers an item at a location (this places the item at that location and records a delivered fact).
  (:action deliver-item
    :parameters (?p - player ?it - item ?l - loc)
    :precondition (and (has ?p ?it) (at_player ?p ?l) (not (delivered ?it ?l)))
    :effect (and (item_at ?it ?l) (not (has ?p ?it)) (delivered ?it ?l))
  )

  ;; Analyst analyzes an item that is present at the same location; analysis must be done before approval.
  (:action analyze-item
    :parameters (?a - analyst ?it - item ?l - loc)
    :precondition (and (at_analyst ?a ?l) (item_at ?it ?l) (not (analyzed ?it)))
    :effect (analyzed ?it)
  )

  ;; Analyst approves an item after it has been analyzed.
  (:action approve-item
    :parameters (?a - analyst ?it - item)
    :precondition (and (analyzed ?it) (not (approved ?it)))
    :effect (approved ?it)
  )
)