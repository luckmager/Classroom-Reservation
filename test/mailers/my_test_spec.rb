require 'test/spec'

context 'DELETE #destroy' do
  let!(:reservation) { create :reservation }

  it 'should delete reservation' do
    expect { delete :destroy, params: { id: reservation.id } }.to change(Reservation, :count).by(-1)
    expect(flash[:notice]).to eq 'Reservation was successfully destroyed.'
  end
end