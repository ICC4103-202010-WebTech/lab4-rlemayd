class Ticket < ApplicationRecord
  belongs_to :order
  belongs_to :ticket_type

  # TODO: complete the folowing
  # before_xxxxx :update_stats
  before_create :update_stats
  after_destroy :delete_stats

  private
  def update_stats
    es = self.ticket_type.event.event_stat
    ev = self.ticket_type.event.event_venue
    # TODO: complete in order to update event stats
    if ev.capacity <= es.attendance
      puts "error, maximum capacity already, cant add more people"
    else
      es.attendance += 1
      es.tickets_sold += 1
      es.save
    end
  end
  private
  def delete_stats
    es = self.ticket_type.event.event_stat
    # TODO: complete in order to update event stats
    es.attendance -= 1
    es.tickets_sold -= 1
    es.save
  end
end
