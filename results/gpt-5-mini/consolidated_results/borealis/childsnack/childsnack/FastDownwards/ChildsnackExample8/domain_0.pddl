(define (domain sandwich-serving)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    tray bread content sandwich place child placeholder slot chef server agent
  )

  (:predicates
    ;; type predicates
    (tray ?t - tray)
    (bread ?b - bread)
    (content ?c - content)
    (sandwich ?s - sandwich)
    (place ?p - place)
    (child ?ch - child)
    (placeholder ?sp - placeholder)
    (slot ?sl - slot)
    (chef ?chf - chef)
    (server ?sv - server)

    ;; locations and availability
    (at ?obj ?p - place)                    ; object (bread/content/sandwich) is at place
    (available-in-kitchen ?r)              ; bread or content available in kitchen
    (placeholder-available ?sp)            ; placeholder is free to bind
    (placeholder-binds ?sp ?s - sandwich)  ; placeholder corresponds to this sandwich id

    ;; resource consumption markers
    (used-bread ?b - bread)
    (used-content ?c - content)

    ;; composition and existence
    (made-from ?s - sandwich ?b - bread ?c - content)
    (sandwich-exists ?s - sandwich)

    ;; gluten attributes (mutually exclusive in model)
    (bread-is-gluten-free ?b - bread)
    (content-is-gluten-free ?c - content)
    (sandwich-is-gluten-free ?s - sandwich)
    (sandwich-contains-gluten ?s - sandwich)

    ;; tray & slot bookkeeping
    (slot-of ?sl - slot ?t - tray)         ; slot belongs to tray
    (free-slot ?sl - slot)                 ; slot currently free
    (occupies-slot ?s - sandwich ?sl - slot)
    (on-tray ?s - sandwich ?t - tray)
    (tray-at ?t - tray ?p - place)
    (tray-pure ?t - tray)                 ; tray has not been contaminated (no regular sandwich placed)
    (tray-capacity-implicit ?t - tray)    ; marker: tray exists and has implicit capacity (slots enforce capacity)

    ;; roles, waiting and serving
    (waiting-at ?ch - child ?p - place)
    (child-allergic-gluten ?ch - child)
    (served ?ch - child)
    (served-with ?ch - child ?s - sandwich)
  )

  ;; MAKE actions
  ;; Make gluten-free sandwich: both constituents must be gluten-free
  (:action make-sandwich-gf
    :parameters (?chf - chef ?sp - placeholder ?s - sandwich ?b - bread ?c - content ?k - place)
    :precondition (and
      (chef ?chf)
      (placeholder ?sp)
      (placeholder-available ?sp)
      (placeholder-binds ?sp ?s)
      (bread ?b)
      (content ?c)
      (available-in-kitchen ?b)
      (available-in-kitchen ?c)
      (at ?b ?k)
      (at ?c ?k)
      (place ?k)
      (bread-is-gluten-free ?b)
      (content-is-gluten-free ?c)
    )
    :effect (and
      (not (placeholder-available ?sp))
      (sandwich ?s)
      (sandwich-exists ?s)
      (at ?s ?k)
      (made-from ?s ?b ?c)
      (sandwich-is-gluten-free ?s)
      (not (available-in-kitchen ?b))
      (not (available-in-kitchen ?c))
      (used-bread ?b)
      (used-content ?c)
      (not (at ?b ?k))
      (not (at ?c ?k))
    )
  )

  ;; Make regular sandwich when bread contains gluten (content may be any)
  (:action make-sandwich-regular-bread-gluten
    :parameters (?chf - chef ?sp - placeholder ?s - sandwich ?b - bread ?c - content ?k - place)
    :precondition (and
      (chef ?chf)
      (placeholder ?sp)
      (placeholder-available ?sp)
      (placeholder-binds ?sp ?s)
      (bread ?b)
      (content ?c)
      (available-in-kitchen ?b)
      (available-in-kitchen ?c)
      (at ?b ?k)
      (at ?c ?k)
      (place ?k)
      (not (bread-is-gluten-free ?b))
    )
    :effect (and
      (not (placeholder-available ?sp))
      (sandwich ?s)
      (sandwich-exists ?s)
      (at ?s ?k)
      (made-from ?s ?b ?c)
      (sandwich-contains-gluten ?s)
      (not (available-in-kitchen ?b))
      (not (available-in-kitchen ?c))
      (used-bread ?b)
      (used-content ?c)
      (not (at ?b ?k))
      (not (at ?c ?k))
    )
  )

  ;; Make regular sandwich when content contains gluten (bread may be any GF/non-GF)
  (:action make-sandwich-regular-content-gluten
    :parameters (?chf - chef ?sp - placeholder ?s - sandwich ?b - bread ?c - content ?k - place)
    :precondition (and
      (chef ?chf)
      (placeholder ?sp)
      (placeholder-available ?sp)
      (placeholder-binds ?sp ?s)
      (bread ?b)
      (content ?c)
      (available-in-kitchen ?b)
      (available-in-kitchen ?c)
      (at ?b ?k)
      (at ?c ?k)
      (place ?k)
      (not (content-is-gluten-free ?c))
    )
    :effect (and
      (not (placeholder-available ?sp))
      (sandwich ?s)
      (sandwich-exists ?s)
      (at ?s ?k)
      (made-from ?s ?b ?c)
      (sandwich-contains-gluten ?s)
      (not (available-in-kitchen ?b))
      (not (available-in-kitchen ?c))
      (used-bread ?b)
      (used-content ?c)
      (not (at ?b ?k))
      (not (at ?c ?k))
    )
  )

  ;; PUT actions: separate for gluten-free sandwiches (tray must be pure) and regular sandwiches (contaminates tray)
  (:action put-gf-sandwich-on-tray
    :parameters (?sv - server ?s - sandwich ?t - tray ?p - place ?sl - slot)
    :precondition (and
      (server ?sv)
      (sandwich-exists ?s)
      (sandwich ?s)
      (sandwich-is-gluten-free ?s)
      (at ?s ?p)
      (tray ?t)
      (tray-at ?t ?p)
      (slot ?sl)
      (slot-of ?sl ?t)
      (free-slot ?sl)
      (tray-pure ?t)
      (place ?p)
    )
    :effect (and
      (on-tray ?s ?t)
      (occupies-slot ?s ?sl)
      (not (free-slot ?sl))
      (not (at ?s ?p))
      ;; tray remains pure
    )
  )

  (:action put-regular-sandwich-on-tray
    :parameters (?sv - server ?s - sandwich ?t - tray ?p - place ?sl - slot)
    :precondition (and
      (server ?sv)
      (sandwich-exists ?s)
      (sandwich ?s)
      (sandwich-contains-gluten ?s)
      (at ?s ?p)
      (tray ?t)
      (tray-at ?t ?p)
      (slot ?sl)
      (slot-of ?sl ?t)
      (free-slot ?sl)
      (place ?p)
    )
    :effect (and
      (on-tray ?s ?t)
      (occupies-slot ?s ?sl)
      (not (free-slot ?sl))
      (not (at ?s ?p))
      (not (tray-pure ?t))  ;; placing a regular sandwich contaminates the tray
    )
  )

  ;; MOVE_TRAY: moves tray between places; sandwiches remain on-tray (no per-sandwich update needed)
  (:action move-tray
    :parameters (?sv - server ?t - tray ?from - place ?to - place)
    :precondition (and
      (server ?sv)
      (tray ?t)
      (tray-at ?t ?from)
      (place ?from)
      (place ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (tray-at ?t ?to)
      (not (tray-at ?t ?from))
    )
  )

  ;; SERVE actions: separate for allergic children (requires tray purity and GF sandwich) and non-allergic children
  (:action serve-allergic-child-from-tray
    :parameters (?sv - server ?ch - child ?s - sandwich ?t - tray ?sl - slot ?p - place)
    :precondition (and
      (server ?sv)
      (child ?ch)
      (child-allergic-gluten ?ch)
      (waiting-at ?ch ?p)
      (tray ?t)
      (tray-at ?t ?p)
      (sandwich ?s)
      (sandwich-exists ?s)
      (sandwich-is-gluten-free ?s)
      (on-tray ?s ?t)
      (occupies-slot ?s ?sl)
      (slot-of ?sl ?t)
      (tray-pure ?t)
      (place ?p)
    )
    :effect (and
      (served ?ch)
      (served-with ?ch ?s)
      (not (on-tray ?s ?t))
      (not (occupies-slot ?s ?sl))
      (free-slot ?sl)
      (not (sandwich-exists ?s))
    )
  )

  (:action serve-nonallergic-child-from-tray
    :parameters (?sv - server ?ch - child ?s - sandwich ?t - tray ?sl - slot ?p - place)
    :precondition (and
      (server ?sv)
      (child ?ch)
      (not (child-allergic-gluten ?ch))
      (waiting-at ?ch ?p)
      (tray ?t)
      (tray-at ?t ?p)
      (sandwich ?s)
      (sandwich-exists ?s)
      (on-tray ?s ?t)
      (occupies-slot ?s ?sl)
      (slot-of ?sl ?t)
      (place ?p)
    )
    :effect (and
      (served ?ch)
      (served-with ?ch ?s)
      (not (on-tray ?s ?t))
      (not (occupies-slot ?s ?sl))
      (free-slot ?sl)
      (not (sandwich-exists ?s))
    )
  )
)